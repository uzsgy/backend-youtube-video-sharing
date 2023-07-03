# README

#### To start project, please run command below:

```ruby
docker-compose -f docker/docker-compose.yml up -d
```

please make sure all port: 63790, 4001, 8888 is not using. it will start 4 services:

- web ruby on rails
- db: mysql 5.7
- redis: latest
- phpmyadmin: to connect with database db

after start all services. you need to execute command below to generate database in rails web application:

```ruby
docker exec -it backend_youtube_video_sharing bash
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

after run command, you can go to this page to check everything work ok. `localhost:4001`
