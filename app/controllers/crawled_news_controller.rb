class CrawledNewsController < ApplicationController
  before_action :set_crawled_news, only: %i[ show ]

  # GET /crawled_news or /crawled_news.json
  def index
   @pagy, @crawled_news = pagy(CrawledNews.all)
  end

  # GET /crawled_news/1 or /crawled_news/1.json
  def show
  end

  # Minera os dados do site
  def news_factory

    
    version_control = params[:version_control]
    last = params[:last]


    CrawlerJob.perform_later(version_control,limit,last)


    render json: "Started To Mine"

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
