FROM nginx:latest

RUN apt-get clean \
  && apt-get update \
  && apt-get install -y spawn-fcgi fcgiwrap perl  \
    libclass-dbi-mysql-perl

RUN sed -i 's/www-data/nginx/g' /etc/init.d/fcgiwrap

RUN chown nginx:nginx /etc/init.d/fcgiwrap

ADD ./vhost.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www

CMD /etc/init.d/fcgiwrap start \
    && nginx -g 'daemon off;'
