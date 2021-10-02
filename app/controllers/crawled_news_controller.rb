class CrawledNewsController < ApplicationController
  before_action :set_crawled_news, only: %i[ show ]

  # GET /crawled_news or /crawled_news.json
  def index
    
    #inicializando variaveis para o search
    @news_filter = CrawledNews.new
    @news_search = CrawledNews.new

    
    unless params[:start] && params[:end] # caso não houver filtras de inicia e fim de data

      
      
      unless params[:full_text] # caso não for full text search
        
        @pagy, @crawled_news = pagy(CrawledNews.search_like('title', params[:title_search]).search_like('body', params[:text_search]).order("publish_date"))

      else # caso for full text search
       
        @pagy, @crawled_news = pagy(CrawledNews.search_news(params[:full_text]).order("publish_date"))

      end
      

    else

     

      if params[:start].to_date && params[ :end ].to_date # caso ambos filtros de periodo de data corresponderem com uma data 


      
        @pagy, @crawled_news = pagy(CrawledNews.search_like('title', params[:title_search]).search_like('body', params[:text_search]).search_between("publish_date", params[:start].to_date, params[:end].to_date ).order("publish_date") )

      else

        if params[:start].to_date # caso filtro de inicio de periodo corresponder com uma data 
         
          @pagy, @crawled_news = pagy(CrawledNews.search_like('title', params[:title_search]).search_like('body', params[:text_search]).search_start("publish_date", params[:start].to_date).order("publish_date"))

        end

        if params[ :end ].to_date # caso filtro de inicio de periodo corresponder com uma data 
         
          @pagy, @crawled_news = pagy(CrawledNews.search_like('title', params[:title_search]).search_like('body', params[:text_search]).search_end("publish_date", params[:end].to_date).order("publish_date"))

        end

        unless params[:start].to_date && params[ :end ].to_date # caso ambos filtros de periodo de data não corresponderem com uma data porém foram enviados


          unless params[:full_text] # caso não for full text search

            @pagy ,@crawled_news = pagy(CrawledNews.search_like('title', params[:title_search]).search_like('body', params[:text_search]).order("publish_date"))

          else # caso for full text search

            @pagy, @crawled_news = pagy(CrawledNews.search_news(params[:full_text]).order("publish_date"))

          end

        end


      end
  
    end    
    
  end

  # GET /crawled_news/1 or /crawled_news/1.json
  def show
  end

  # Minera os dados do site
  def news_factory

    
    version_control = params[:version_control]
    last = params[:last]


    CrawlerJob.perform_later(version_control,last)

    respond_to do |format|
          format.html { redirect_to root_url, notice: "Started To Mine" }
    end
    

  end

  # GET /crawled_news/new
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crawled_news
      @crawled_news = CrawledNews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crawled_news_params
      params.require(:crawled_news).permit(:title, :publish_date, :subtitle, :body, :link, :url)
    end
end
