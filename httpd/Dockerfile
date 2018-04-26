# Image with httpd
# docker build -t ilonghi/httpd:1.0.0 .

FROM centos:7.4.1708

RUN yum -y update && \
    yum -y install \
      make \
      gcc \
      pcre-devel \
      expat-devel

WORKDIR /usr/local/src

RUN curl -SL http://mirror.nohup.it/apache/httpd/httpd-2.4.29.tar.gz -o httpd-2.4.29.tar.gz && \
    tar xzf httpd-2.4.29.tar.gz && \
    cd httpd-2.4.29/srclib && \
    curl -SL http://mirror.nohup.it/apache/apr/apr-1.6.3.tar.gz -o apr-1.6.3.tar.gz && \
    tar zxf apr-1.6.3.tar.gz && \
    mv apr-1.6.3 apr && \
    rm apr-1.6.3.tar.gz && \
    curl -SL http://mirror.nohup.it/apache/apr/apr-util-1.6.1.tar.gz -o apr-util-1.6.1.tar.gz && \
    tar zxf apr-util-1.6.1.tar.gz && \
    mv apr-util-1.6.1 apr-util && \
    rm apr-util-1.6.1.tar.gz && \
    cd .. && \
    ./configure --prefix=/usr/local/apache --with-included-apr --with-mpm=prefork && \
    make && \
    make install && \
    cd .. && \
    rm -rf httpd-2.4.29.tar.gz httpd-2.4.29

RUN yum clean all && \
    rm -rf /tmp/*

WORKDIR /
