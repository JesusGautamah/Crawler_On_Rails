class Api::V1::CrawledNewsController < Api::V1::ApiController
   
    def index

        unless params[:start] && params[:end]

             
             unless params[:full_text]

               @crawled_news = CrawledNews.search_like('title', params[:title_search]).search_like('body', params[:text_search]).order("publish_date")
       
             else
              
               @crawled_news = CrawledNews.search_news(params[:full_text]).order("publish_date")
       
             end
      
          else
      
           
      
            if params[:start].to_date && params[ :end ].to_date
            
               @crawled_news =  CrawledNews.search_like('title', params[:title_search]).search_like(' subtitle', params[:text_search]).search_between("publish_date", params[:start].to_date, params[:end].to_date ).order("publish_date") 
            else
      
              if params[:start].to_date
               
                 @crawled_news =  CrawledNews.search_like('title', params[:title_search]).search_like(' subtitle', params[:text_search]).search_start("publish_date", params[:start].to_date).order("publish_date")
      
              end
              if params[ :end ].to_date
               
                 @crawled_news =  CrawledNews.search_like('title', params[:title_search]).search_like(' subtitle', params[:text_search]).search_end("publish_date", params[:end].to_date).order("publish_date")
      
              end
      
               unless params[:full_text]
                  @crawled_news = CrawledNews.search_like('title', params[:title_search]).search_like('body', params[:text_search]).order("publish_date")
               else
                  @crawled_news = CrawledNews.search_news(params[:full_text]).order("publish_date")
               end
      
      
            end
        
          end 

        render json: @crawled_news
        
      
    end

    def news_factory

        
        version_control = params[:version_control]
        last = params[:last]

     
        NewsJob.perform_later(version_control,last)
     
       
        render json: "Started To Mine"
        
    end

   
end