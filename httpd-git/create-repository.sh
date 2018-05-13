#!/bin/bash

REPOS=$1

mkdir /usr/local/apache2/htdocs/git/$REPOS && \
  cd /usr/local/apache2/htdocs/git/$REPOS && \
  git init --bare && \
  chown -R www-data:www-data /usr/local/apache2/htdocs/git/$REPOS && \
  echo "New bare repository created:" && \
  echo "git clone http://$APACHE_GIT_HOST/git/$REPOS"
