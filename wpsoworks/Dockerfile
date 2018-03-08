# docker build -t wpsoworks .

FROM ilonghi/httpd-mod_perl:1.0.0

RUN yum -y update && \
    yum -y install \
      which

RUN groupadd -g 1000 web && \
    useradd -u 1000 -g web wpsoworks

WORKDIR /home/wpsoworks

RUN ln -s WPSOWORKS/etc && chown -h wpsoworks:web etc && \
    ln -s WPSOWORKS/share && chown -h wpsoworks:web share

RUN echo -e "\n. ~/etc/profile.sh\n" >> .bash_profile

USER wpsoworks

EXPOSE 10091

WORKDIR /home/wpsoworks
