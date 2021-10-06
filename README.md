# **Crawler On Rails**

### **Projeto criado para teste da empresa Data Science Brigade.**
### **Crawler adicionado ao Active Jobs com Sidekiq e Redis para processos em Background.**
### **Ao invés de interface de linha de comandos, foi adicionado a versão api com parametros, para alimentar minha futura aplicação flutter para portfolio.**
### **Pagina Index Contém somente algumas informações das noticias, para vizualisar completamente, clique no botão SHOW**

### **Pagina http://mds.gov.br/area-de-imprensa/noticias não está disponivel(offline), crawler puxando diversas paginas de https://www.gov.br/turismo/pt-br/assuntos/noticias**


## * **Routes**
1) root on crawled_news index + filters (app and api) 
2) crawled_news show (app only)
3) mine information on /news_factory (app and api)






## * **Ruby 2.7**
## * **Rails 5.2.6**
## * **Web Preview https://crawler-news.herokuapp.com/**

## * **System dependencies**
1) Postgresql
2) Redis Server
3) Heroku cli

## * **Heroku Config Vars (https://dashboard.heroku.com/apps/YOUR-APPLICATION-NAME/settings)**

                SIDEKIQ_USERNAME: SET SIDEKIQ WEBVIEW USER
                SIDEKIQ_PASSWORD: SET SIDEKIQ WEBVIEW PASSWORD

## * **Heroku Configuration (HEROKU CLI)**

                 heroku ps:scale web=1 -a YOUR-HEROKU-APP-NAME
                 heroku ps:scale worker+1 -a YOUR-HEROKU-APP-NAME

## * **Heroku Monitor (HEROKU CLI)**

                 heroku logs --tail -a


## * **Sidekiq Web View**

### in route /sidekiq
### use your heroku config vars sidekiq login


## * **Sidekiq Web View Preview**

### in route  https://crawler-news.herokuapp.com/sidekiq
### Username: Admin
### Password: 0F2D2FA54BE36031D46155C70A2A2458

#  **Local Configuration and more information in main branch**

