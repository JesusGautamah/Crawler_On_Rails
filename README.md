# **Crawler On Rails**


* **Ruby 2.7**
* **Rails 5.2.6**

* **System dependencies**
1) Postgresql

* **Configuration**
1) Edit exports.sh with your postgres database login


                export DB_USER="YOUR DB USER"
                export DB_PASS="YOUR DB PASSWORD"

2) Or edit databse configuration on /config/database.yml

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







* **Database creation**
1) run 

                rake db:create
                
    

* **Database initialization**

 1) run 

                rake db:migrate

* **OR Database creation & initialization**

 1) run 

                rake db:setup

* Rspec test
1) run

                rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
