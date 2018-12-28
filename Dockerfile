FROM ubuntu:18.04

MAINTAINER Edward J. Kim <edward@edwardkim.org>

RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    m4 \
    vim

ENV SCHEME_VERSION 10.1.3
ENV SCHEME_TAR mit-scheme-${SCHEME_VERSION}-x86-64.tar.gz

WORKDIR /tmp
RUN wget http://ftp.gnu.org/gnu/mit-scheme/stable.pkg/${SCHEME_VERSION}/${SCHEME_TAR} && \
    wget http://ftp.gnu.org/gnu/mit-scheme/stable.pkg/${SCHEME_VERSION}/md5sums.txt && \
    cat md5sums.txt | awk '/${SCHEME_TAR}/ {print}' | tee md5sums.txt && \
    tar xf ${SCHEME_TAR}

RUN cd /tmp/mit-scheme-${SCHEME_VERSION}/src && \
    ./configure && \
    make && \
    make install

RUN cd /tmp && \
    rm -rf mit-scheme-${SCHEME_VERSION} ${SCHEME_TAR} md5sums.txt

WORKDIR /work

