json.extract! crawled_news, :id, :title, :publish_date, :subtitle, :body, :link, :url, :created_at, :updated_at
json.url crawled_news_url(crawled_news, format: :json)
