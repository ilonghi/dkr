# docker build -t wpsoworks .

FROM ilonghi/httpd-mod_perl:1.0.0

RUN yum -y update && \
    yum -y install \
      which

RUN groupadd -g 1000 web && \
    useradd -u 1000 -g web wpsoworks

USER wpsoworks

EXPOSE 10091

WORKDIR /home/wpsoworks
