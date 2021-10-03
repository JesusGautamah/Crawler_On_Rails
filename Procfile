web: bundle exec thin start -R config.ru -e $Rails_ENV -p $PORT
worker: bundle exec sidekiq -e production -C config/sidekiq.yml -q high_priority
release: bundle exec rake db:migrate