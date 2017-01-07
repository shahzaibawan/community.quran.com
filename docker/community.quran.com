server {
  listen   3000;
  server_name  community.quran.com;

  access_log  /var/log/nginx/community.quran.com/access.log;
  error_log  /var/log/nginx/community.quran.com/error.log;

  location / {
    passenger_enabled on;
    passenger_user app;
    passenger_ruby /usr/bin/ruby2.3;
    passenger_app_env production;
    passenger_max_request_queue_size 200;
    root   /home/app/community/public;
    index  index.html index.htm;
  }
}
