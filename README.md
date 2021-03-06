# **Crawler On Rails**

### **Crawler adicionado ao Active Jobs com Sidekiq e Redis para processos em Background.**
### **Pagina Index Contém somente algumas informações das noticias, para vizualisar completamente, clique no botão SHOW**

### **Crawler puxando diversas paginas de https://www.gov.br/turismo/pt-br/assuntos/noticias**


## * **Routes**
1) root on crawled_news index + filters (app and api) 
2) crawled_news show (app only)
3) mine information on /news_factory (app and api)


## * **Ruby 2.7**
## * **Rails 5.2.6**
## * **Web Preview https://crawler-news.herokuapp.com/**

## * **API Consume Preview In Py Notebook https://github.com/JesusGautamah/cn-api-py-nb**


#  **Local Docker Configuration** 

## * **System dependencies**
1) docker
2) docker-compose
3) run


                docker-compose up

2) create db, in another terminal run

                docker-compose run web rake db:setup

3) not rendering template?

                docker-compose run web rake assets:clobber
                docker-compose run web rake assets:precompile

## * Heroku Config Vars (https://dashboard.heroku.com/apps/YOUR-APPLICATION-NAME/settings)


                SIDEKIQ_USERNAME: SET SIDEKIQ WEBVIEW USER
                SIDEKIQ_PASSWORD: SET SIDEKIQ WEBVIEW PASSWORD

## * Heroku Configuration (HEROKU CLI)

                heroku ps:scale web=1 -a YOUR-HEROKU-APP-NAME
                heroku ps:scale worker+1 -a YOUR-HEROKU-APP-NAME

## * Heroku Monitor (HEROKU CLI)

                heroku logs --tail -a <YOUR-HEROKU-APP-NAME>


## * **APP/API params for mine news data on /news_factory**


                params[:version_control] # start data mine from given integer in param

                params[:last] # start data mine from last crawled_news id if setted to a number >= 1

                params[:limit] # control limit of catching pages
                
## * **API Crawled News Index params**


                params[:start] # start date filter
                params[:end] # end date filter
                params[:title_search] # title filter
                params[:text_search] # text body filter

                # work separately
                params[:full_text] # full text search


## * **API endpoints**

                http://localhost:3000/api/v1/crawled_news + params
                http://localhost:3000/api/v1/news_factory + params


