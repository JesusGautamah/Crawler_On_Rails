require 'sidekiq/web'

Rails.application.routes.draw do

  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end

  draw :sidekiq

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_USERNAME"])) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_PASSWORD"]))
  end
  



 



















  resources :crawled_news
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "crawled_news#index"
  get "news_factory", to: "crawled_news#news_factory"

  #api mode
  namespace :api do
    namespace :v1 do

      resources :crawled_news 

      
      get "/news_factory/", to:  "crawled_news#news_factory"

      root to: "crawled_news#index"

      

    end
  end
end
