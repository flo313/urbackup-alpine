FROM ubuntu:latest

ENV VERSION 2.2.11
ENV URL https://hndl.urbackup.org/Server/${VERSION}/urbackup-server-${VERSION}.tar.gz

ADD ${URL} /tmp/urbackup-server-${VERSION}.tar.gz 

RUN apt-get update &&\
    apt-get install -y build-essential zlib1g-dev libcurl4-gnutls-dev libcrypto++-dev
   tar -xf /tmp/urbackup-server-${VERSION}.tar.gz -C /tmp &&\
   cd /tmp/urbackup-server-${VERSION} &&\
   ./configure &&\
   make &&\
   make install &&\
   apt-get remove build-essential && apt-get autoremove && \
   rm -rf /var/cache/apk/* /tmp/*

EXPOSE 55413
EXPOSE 55414
EXPOSE 55415
EXPOSE 35623

VOLUME [ "/var/urbackup", "/var/log", "/usr/share/urbackup" ]
ENTRYPOINT ["urbackupsrv"]
CMD ["run"]
