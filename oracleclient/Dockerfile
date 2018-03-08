# Image with Linux Oracle instant client
# docker build -t ilonghi/oracleclient:1.0.0 .

FROM centos:7.4.1708

COPY . /tmp/

WORKDIR /tmp

RUN yum -y update && \
    yum -y install \
      libaio.x86_64 \
      glibc.x86_64

RUN yum -y localinstall \
      oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm \
      oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm \
      oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm \
      --nogpgcheck

RUN mkdir -p /usr/lib/oracle/12.2/client64/network/admin
COPY ./tnsnames.ora /usr/lib/oracle/12.2/client64/network/admin/tnsnames.ora

ENV ORACLE_BASE=/usr/lib/oracle
ENV ORACLE_HOME=$ORACLE_BASE/12.2/client64
ENV PATH=$PATH:$ORACLE_HOME/bin
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib
ENV TNS_ADMIN=$ORACLE_HOME/network/admin

RUN rm \
      oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm \
      oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm \
      oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm \
      tnsnames.ora

WORKDIR /
