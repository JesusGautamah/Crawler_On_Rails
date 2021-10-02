# **Crawler On Rails**

### **Projeto criado para teste da empresa Data Science Bragade.**
### **Crawler adicionado ao Active Jobs com Sidekiq e Redis para processos em Background.**
### **Ao invés de interface de linha de comandos, foi adicionado a versão api com parametros, para alimentar minha futura aplicação flutter para portfolio.**
### **Pagina Index Contém somente algumas informações das noticias, para vizualisar completamente, clique no botão SHOW**

### **Pagina http://mds.gov.br/area-de-imprensa/noticias não está disponivel, crawler puxando diversas paginas de https://www.gov.br/turismo/pt-br/assuntos/noticias**


## * **Routes**
1) root on crawled_news index + filters (app and api) 
2) crawled_news show (app only)
3) mine information on /news_factory (app and api)






## * **Ruby 2.7**
## * **Rails 5.2.6**

## * **System dependencies**
1) Postgresql
2) Redis Server

## * **Configuration**
1) Install dependencies

                bundle install



2) Edit exports.sh with your postgres database login


                export DB_USER="YOUR DB USER"
                export DB_PASS="YOUR DB PASSWORD"

3) Or edit databse configuration on /config/database.yml

                default: &default
                    adapter: postgresql
                    encoding: unicode
                    username: <%= ENV['DB_USER'] %>
                    password: <%= ENV['DB_PASS'] %>
                    # For details on connection pooling, see Rails              configuration guide
                    # http://guides.rubyonrails.org/configuring.            html#database-pooling
                    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
                
                development:
                    <<: *default
                    database: crawler_on_rails_development
                test:
                    <<: *default
                    database: crawler_on_rails_test


                #   production:
                #     url: <%= ENV['DATABASE_URL'] %>
                #
                production:
                  <<: *default
                  database: crawler_on_rails_production
                  username: crawler_on_rails
                  password: <%= ENV['CRAWLER_ON_RAILS_DATABASE_PASSWORD'] %>







## * **Database creation**
1) run 

                rake db:create
                
    

## * **Database initialization**

 1) run 

                rake db:migrate

## * **OR Database creation & initialization**

 1) run 

                rake db:setup

## * **Rspec test**
1) run

                rspec

## * **Services (job queues, cache servers, search engines, etc.)**

1) Crawler job


    **Can be activated in /news_factory or /api/v1/news_factory routes to mine site news**

## * **Init the app**

1) run exports.sh (first termminal)

                source exports.sh

1) to start redis server run (second terminal)
                
                redis-server

2) to start sidekiq run (third terminal)

                bundle exec sidekiq -q high_priority

3) run puma server (first terminal)

                rails s

4) optional run on 0.0.0.0 to access rails in local devices (first terminal)

                rails s -b 0.0.0.0


5) if u r using wsl, run this command on windows powrshell to run on 0.0.0.0 and access rails in local devices (administrator only)

                netsh interface portproxy add v4tov4 listenport=3000 listenaddress=0.0.0.0 connectport=3000 connectadress=YOUR-WSL-INET-IP


<<<<<<< Updated upstream
=======

## * **APP/API params for mine news data on /news_factory**


                params[:version_controll] # start mine from given integer in param
                params[:last] # start mine from last crawled_news id if setted to a number > 1



                params[:limit] # REMOVED control limit of catching pages , stopping job on currently rails 5.2 of this project, tested on rails 7.0 alpha and worked, maybe will be added to a new branch
                


>>>>>>> Stashed changes
## * **API params**


                params[:start] # start date filter
                params[:end] # end date filter
                params[:title_search] # title filter
                params[:text_search] # text body filter

                # work separately
                params[:full_text] # full text search



## * **API endpoints**

                http://localhost:3000/api/v1/crawled_news + params
                http://localhost:3000/api/v1/news_factory



