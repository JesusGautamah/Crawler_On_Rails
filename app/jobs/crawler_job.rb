class CrawlerJob < ApplicationJob
    queue_as :high_priority

    # Caso a noticia não exista no banco de dados, grave-a
    def save_news( title, publish_date, subtitle, link, url, body)

        puts('checking')
        #checando
        unless CrawledNews.where(title: title, publish_date: publish_date).exists?

            puts('validated, now creating')
            #salvando
            CrawledNews.create(title: title, publish_date: publish_date.to_date, subtitle: subtitle,link: link, url: url,body: body)

            puts('created')

        else
            # já existe
            puts('already exits')

        end

    end

    # Fazer o primeiro request na primeira pagina caso o numero for 0, então buscar pelas outras
    def request_news(page_number) 

        if page_number == 0

            # link principal

            url =  'https://www.gov.br/turismo/pt-br/assuntos/noticias'
        else

            # link da página + numero de noticias

            url =  ('https://www.gov.br/turismo/pt-br/assuntos/noticias?b_start:int=' + page_number.to_s)

        end

        # realiza o request
        @request = Nokogiri::HTML(URI.open(url))

        #pegando todas noticias
        @request_CrawledNews = @request.css('ul.noticias')

            #separando noticias
            @request_CrawledNews.css('div.conteudo').each do |div|


                # coletando informações da noticia

                link = (div.css('h2.titulo a').map { |link| link['href'] }).to_s.gsub("[\"",'').gsub("\"]",'')

                title = div.css('h2.titulo').text.to_s.gsub("\n",'')

                date = div.css('span.data').text.to_s.gsub("-\n",'').gsub("\n",'')

                div.css('span.data').remove

                desc = div.css('span.descricao').text.to_s.gsub("\n",'').sub( div.css('span.data').text,'')

                # request na pagina da noticia
                body = Nokogiri::HTML(URI.open(link))


                #carrega corpo da noticia
                body_html = body.at_css('[property="rnews:articleBody"]')
                
                # metodo de salvamento da função acima
                save_news( title, date, desc, link, url, body_html)
                
            end

    end



    def request_job(version_num=nil, last=nil, limit=nil )


        if last && last.to_i >= 1
            last_id = CrawledNews.all.order("created_at").last.id
        end
       

        ((last_id || (version_num || 0)).. (limit || 300) ).step(10) do |n|
            request_news(n)
            puts(n)
            unless n == 0
                puts( (n*100/(limit || 300)).to_s + "%")
            else
                puts("0%")
            end
        end

       

    end
    
    def perform(version_num=nil, last=nil, limit=nil)
        
       request_job(version_num.to_i, last.to_i, limit.to_i)

    end

end