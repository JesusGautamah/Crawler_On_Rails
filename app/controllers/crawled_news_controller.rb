class CrawledNewsController < ApplicationController
  before_action :set_crawled_news, only: %i[ show edit update destroy ]

  # GET /crawled_news or /crawled_news.json
  def index
    @crawled_news = CrawledNews.all
  end

  # GET /crawled_news/1 or /crawled_news/1.json
  def show
  end

  # GET /crawled_news/new
  def new
    @crawled_news = CrawledNews.new
  end

  # GET /crawled_news/1/edit
  def edit
  end

  # POST /crawled_news or /crawled_news.json
  def create
    @crawled_news = CrawledNews.new(crawled_news_params)

    respond_to do |format|
      if @crawled_news.save
        format.html { redirect_to @crawled_news, notice: "Crawled news was successfully created." }
        format.json { render :show, status: :created, location: @crawled_news }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crawled_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crawled_news/1 or /crawled_news/1.json
  def update
    respond_to do |format|
      if @crawled_news.update(crawled_news_params)
        format.html { redirect_to @crawled_news, notice: "Crawled news was successfully updated." }
        format.json { render :show, status: :ok, location: @crawled_news }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crawled_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crawled_news/1 or /crawled_news/1.json
  def destroy
    @crawled_news.destroy
    respond_to do |format|
      format.html { redirect_to crawled_news_index_url, notice: "Crawled news was successfully destroyed." }
      format.json { head :no_content }
    end
  end

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
