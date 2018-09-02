FROM alpine:edge

ENV VERSION 2.2.11
ENV URL https://hndl.urbackup.org/Server/${VERSION}/urbackup-server-${VERSION}.tar.gz

ADD ${URL} /tmp/urbackup-server-${VERSION}.tar.gz
