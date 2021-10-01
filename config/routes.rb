Rails.application.routes.draw do

  # configuração do sidekiq
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

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
