FROM yfix/baseimage

MAINTAINER Yuri Vysotskiy (yfix) <yfix.dev@gmail.com>

ENV MYDUMPER_VERSION_MAJOR 0.9
ENV MYDUMPER_VERSION 0.9.1

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    build-essential \
    cmake \
    libglib2.0-dev \
    libmysqlclient15-dev \
    zlib1g-dev \
    libpcre3-dev \
    python-sphinx \
  \
  && cd /tmp \
  && wget https://launchpad.net/mydumper/$MYDUMPER_VERSION_MAJOR/$MYDUMPER_VERSION/+download/mydumper-$MYDUMPER_VERSION.tar.gz \
  && tar -xzvf mydumper-$MYDUMPER_VERSION.tar.gz \
  && cd mydumper-$MYDUMPER_VERSION \
  && cmake . -DCMAKE_INSTALL_PREFIX=/usr/local \
  && make \
  && make install \
  \
  && cd .. \
  && rm -rvf mydumper-$MYDUMPER_VERSION.tar.gz \
  && rm -rvf mydumper-$MYDUMPER_VERSION \
  \
  && apt-get purge -y --auto-remove \
    libglib2.0-dev \
    libmysqlclient15-dev \
    zlib1g-dev \
    libpcre3-dev \
    binutils \
    build-essential \
    cmake \
    make \
    gcc \
    g++ \
    cpp \
    sphinx-common \
    sphinx-doc \
    docutils-common \
    dpkg-dev \
  \
  && apt-get install -y --no-install-recommends \
    libglib2.0-0 \
    libmysqlclient-dev \
  \
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /usr/share/{doc,man}/* \
  && rm -rf /var/lib/apt/lists/*

ADD mydumper.sh /mydumper.sh
ADD myloader.sh /myloader.sh

WORKDIR /
CMD /mydumper.sh
