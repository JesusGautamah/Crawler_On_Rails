# **Crawler On Rails**


* **Ruby 2.7**

* **System dependencies**
1) Postgresql

* **Configuration**
1) Edit exports.sh with your db login


                export DB_USER="YOUR DB USER"
                export DB_PASS="YOUR DB PASSWORD"



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
