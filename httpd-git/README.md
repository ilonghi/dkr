# README

Git repository over http

## Build image

```
docker build -t ilonghi/httpd-git:0.0.1 .
```

## Create a persistent volume

```
docker volume create httpd-git-dsk
```

## Run the container

```
docker run -d \
  -v httpd-git-dsk:/usr/local/apache2/htdocs/git \
  --name httpd-git \
  -p 10090:80 \
  ilonghi/httpd-git:0.0.1
```

## Create a bare git repository

```
docker run -ti --rm \
  -v httpd-git-dsk:/usr/local/apache2/htdocs/git \
  --env APACHE_GIT_HOST=$(ifconfig docker0 | grep 'inet addr' | sed -r 's/.*inet addr:([^ ]+) .*/\1/'):10090 \
  ilonghi/httpd-git:0.0.1 \
  create-repository.sh test.git
```

## Create a user with write access to repositories

```
docker exec -ti \
  httpd-git \
  htpasswd /usr/local/etc/git-passwd ivan
```
