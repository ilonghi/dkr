# README

## inizializzazione
```shell
### creare symlink
ln -s ../../hdtfo-restart-ws WPHDTFO
ln -s ../../hdtfo-restart WPHDTFOUI
ln -s ../../COM COM

### creare la rete
docker network create wphdtfo-net

### creare i volumi e le directory necessarie
docker volume create wphdtfo-art-repository-dsk
docker run -ti --rm \
  -v wphdtfo-art-repository-dsk:/home/wphdtfows/var/art_repository \
  -v $(pwd)/wphdtfo-art-repository-dsk/init.sh:/tmp/init.sh \
  centos:7.4.1708 \
  bash /tmp/init.sh

docker volume create wphdtfo-repository-dsk
docker run -ti --rm \
  -v wphdtfo-repository-dsk:/home/wphdtfows/var/repository \
  -v $(pwd)/wphdtfo-repository-dsk/init.sh:/tmp/init.sh \
  centos:7.4.1708 \
  bash /tmp/init.sh

docker volume create wphdtfo-session-artlegacy
docker volume create wphdtfo-session-ivr
```

## api.art.conf
Creare nella directory corrente il file `api.art.conf` che sarà copiato nelle
immagini come `/home/wphdtfows/.api.art.conf`.

## servizi
```shell
docker-compose up --build --force-recreate
docker-compose -f docker-compose-no-daemon.yml up --build --force-recreate --no-start
```

## crontab
```
### report giornaliero accessi con caricamento via ftp su sistema aziendale per audit
07 00 * * * docker start wphdtfows-oss-sau
```

## operation
```shell
docker run -ti --rm \
  --volume $(pwd)/WPHDTFO:/home/wphdtfows/WPHDTFO \
  --volume $(pwd)/COM:/home/wphdtfows/COM \
  --volume wphdtfo-art-repository-dsk:/home/wphdtfows/var/art_repository \
  --volume wphdtfo-repository-dsk:/home/wphdtfows/var/repository \
  --hostname wphdtfows-oss \
  --network wphdtfo-net \
  ilonghi/wphdtfows-oss:0.0.1 \
  bash
```

### esempio
```shell
activity_sanity -l $COM/etc/activity_sanity.docker.log4perl.conf ...
```

## TODO
* far funzionare mutt
* abilitare ssl nel proxy web
* proteggere phpmemcachedadmin
