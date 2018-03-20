# Image with perl 5.26.1, DBD::Oracle 1.74 and Dancer2 0.160000
# docker build -t ilonghi/perl:1.1.0 .

FROM ilonghi/oracleclient:1.0.0

RUN yum -y update && \
    yum -y install \
      make \
      gcc \
      openssl \
      openssl-devel

WORKDIR /usr/local/src

RUN curl -SL http://www.cpan.org/src/5.0/perl-5.26.1.tar.gz -o perl-5.26.1.tar.gz && \
    tar xzf perl-5.26.1.tar.gz && \
    cd perl-5.26.1 && \
    CFLAGS='-m64 -mtune=nocona' ./Configure -Duse64bitall -Duseithreads -des -A ccflags=-fPIC && \
    make && \
    make test_harness && \
    make install && \
    cd .. && \
    rm -rf perl-5.26.1.tar.gz perl-5.26.1

RUN curl -SL https://cpanmin.us | perl - App::cpanminus

RUN cpanm \
      enum \
      DBI \
      Array::Utils \
      Authen::Radius \
      Log::Log4perl \
      Tie::IxHash \
      IO::String \
      DateTime::Format::ISO8601 \
      Locale::TextDomain \
      REST::Client \
      Crypt::JWT \
      Excel::Writer::XLSX \
      Text::CSV::Encoded \
      Date::Calc \
      Text::Wrapper \
      Spreadsheet::WriteExcel \
      Text::Autoformat \
      Text::CSV_XS \
      MIME::Lite \
      Config::Simple \
      Cache::Memcached \
      MIME::Base32 \
      Log::Dispatch::Screen \
      CGI \
      File::CacheDir

RUN curl -SL https://cpan.metacpan.org/authors/id/P/PY/PYTHIAN/DBD-Oracle-1.74.tar.gz -o DBD-Oracle-1.74.tar.gz && \
    tar zxf DBD-Oracle-1.74.tar.gz && \
    cd DBD-Oracle-1.74 && \
    perl Makefile.PL -l && \
    make && \
    make test && \
    make install && \
    cd .. && \
    rm -rf DBD-Oracle-1.74.tar.gz DBD-Oracle-1.74

RUN cpanm --installdeps Dancer2@0.160000 && \
    cpanm --notest Dancer2@0.160000

# FIXME
# RUN yum -y install clamav-server
# RUN cpanm File::Scan::ClamAV

WORKDIR /
