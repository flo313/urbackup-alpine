FROM alpine:edge

ENV VERSION 2.2.11
ENV URL https://hndl.urbackup.org/Server/${VERSION}/urbackup-server-${VERSION}.tar.gz

ADD ${URL} /tmp/urbackup-server-${VERSION}.tar.gz 

RUN apk add --no-cache btrfs-progs && \
    apk add --no-cache --virtual=build-dependencies \
	bsd-compat-headers \
	cmake \
	curl \
	curl-dev \
	findutils \
	ffmpeg-dev \
	gettext-dev \
	gcc \
	git \
	g++ \
	libressl-dev \
	libvpx-dev \
	linux-headers \
	make \
	opus-dev \
	tar \
        uriparser-dev &&\
   tar -xfv /tmp/urbackup-server-${VERSION}.tar.gz &&\
   cd /tmp &&\
   ./configure &&
   ./make &&
   ./make-install &&
   apk del --purge build-dependencies && \
   rm -rf /var/cache/apk/* /tmp/*

EXPOSE 55413
EXPOSE 55414
EXPOSE 55415
EXPOSE 35623

VOLUME [ "/var/urbackup", "/var/log", "/usr/share/urbackup" ]
ENTRYPOINT ["/usr/bin/urbackupsrv"]
CMD ["run"]
