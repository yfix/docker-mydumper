FROM yfix/baseimage

MAINTAINER Yuri Vysotskiy (yfix) <yfix.dev@gmail.com>

ENV MYDUMPER_VERSION_MAJOR 0.9
ENV MYDUMPER_VERSION 0.9.2

RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    cmake \
    libglib2.0-dev \
    libmysqlclient15-dev \
    zlib1g-dev \
    libpcre3-dev \
    python-sphinx

RUN wget https://launchpad.net/mydumper/$MYDUMPER_VERSION_MAJOR/$MYDUMPER_VERSION/+download/mydumper-$MYDUMPER_VERSION.tar.gz && \
    tar -xzvf mydumper-$MYDUMPER_VERSION.tar.gz && \
    cd mydumper-$MYDUMPER_VERSION && \
    cmake . -DCMAKE_INSTALL_PREFIX=/usr/local && \
    make && \
    make install

ADD mydumper.sh /mydumper.sh
ADD myloader.sh /myloader.sh

WORKDIR /
CMD /mydumper.sh
