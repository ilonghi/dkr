# Image with httpd 2.4.29 and mod_perl 2.0.10 (DSO)
# docker build -t ilonghi/httpd-mod_perl:1.0.0 .

FROM ilonghi/perl:1.0.0

RUN yum -y update && \
    yum -y install \
      epel-release && \
    yum -y install \
      pcre-devel \
      expat-devel \
      db4-devel

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

RUN curl -SL http://mirror.nohup.it/apache/perl/mod_perl-2.0.10.tar.gz -o mod_perl-2.0.10.tar.gz && \
    tar xzf mod_perl-2.0.10.tar.gz && \
    cd mod_perl-2.0.10 && \
    perl Makefile.PL MP_APXS=/usr/local/apache/bin/apxs && \
    make && \
    make test && \
    make install && \
    cd .. && \
    rm -rf mod_perl-2.0.10.tar.gz mod_perl-2.0.10

RUN cpanm \
      Apache::DBI \
      Apache::ASP

RUN sed -i.bkp 's/->remote_ip/->client_ip/g' /usr/local/lib/perl5/site_perl/5.26.1/Apache/ASP/StateManager.pm && \
    sed -i.bkp 's/->remote_ip/->client_ip/g' /usr/local/lib/perl5/site_perl/5.26.1/Apache/ASP/CGI.pm

RUN mkdir /usr/local/BerkeleyDB && \
    cd /usr/local/BerkeleyDB && \
    ln -s /usr/include/libdb4 include && \
    ln -s /usr/lib64/libdb4 lib && \
    cpanm DB_File

WORKDIR /
