# docker build -t ilonghi/httpd-git:0.0.1 .

FROM httpd:2.4-alpine

RUN apk update && \
  apk add git-daemon

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

COPY ./create-repository.sh /usr/local/bin/create-repository.sh

RUN mkdir -p /usr/local/apache2/htdocs/git && \
  chown www-data:www-data /usr/local/apache2/htdocs/git && \
  mkdir /usr/local/etc && \
  touch /usr/local/etc/git-passwd
