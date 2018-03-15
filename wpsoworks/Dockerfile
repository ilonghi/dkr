# docker build -t wpsoworks .

FROM ilonghi/httpd-mod_perl:1.0.0

RUN yum -y update && \
    yum -y install \
      which

COPY ./tnsnames.ora /usr/lib/oracle/12.2/client64/network/admin/tnsnames.ora

RUN groupadd -g 1000 web && \
    useradd -u 1000 -g web wpsoworks

COPY ./bash_profile /home/wpsoworks/.bash_profile

COPY ./api.art.conf /home/wpsoworks/.api.art.conf

RUN chown wpsoworks:web /home/wpsoworks/.bash_profile && \
    chown wpsoworks:web /home/wpsoworks/.api.art.conf

WORKDIR /home/wpsoworks

RUN ln -s WPSOWORKS/etc && chown -h wpsoworks:web etc && \
    ln -s WPSOWORKS/share && chown -h wpsoworks:web share && \
    ln -s WPSOWORKS/bin && chown -h wpsoworks:web bin && \
    ln -s WPSOWORKS/tmp && chown -h wpsoworks:web tmp && \
    ln -s WPSOWORKS/var && chown -h wpsoworks:web var && \
    ln -s COM/share/www/ARTLEGACY ARTNEW && chown -h wpsoworks:web ARTNEW && \
    ln -s ARTNEW ART && chown -h wpsoworks:web ART

RUN cpanm \
      Date::Calc \
      Text::Wrapper \
      Spreadsheet::WriteExcel \
      File::CacheDir \
      Text::Autoformat \
      Text::CSV_XS

RUN cpanm \
      MIME::Lite

RUN cpanm \
      Config::Simple

#RUN yum -y install clamav-server

#RUN cpanm \
    #-v File::Scan::ClamAV

# RUN yum -y install libc-client

RUN cpanm Cache::Memcached

RUN cpanm MIME::Base32

RUN cpanm Log::Dispatch::Screen

USER wpsoworks

EXPOSE 10080 10090 10091

WORKDIR /home/wpsoworks
