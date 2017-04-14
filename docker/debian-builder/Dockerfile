FROM ubuntu:trusty

MAINTAINER Brett Smith <xbcsmith@gmail.com>

RUN groupadd -r builder && useradd -r -g builder -d /build builder

ENV LC_ALL C.UTF-8

RUN apt-get update -y \
 && apt-get install -y \
    apt-mirror \
    apt-transport-https \
    ca-certificates \
    curl \
    make \
    openssl \
    vim \
    wget \
    xz-utils \
    build-essential \
    devscripts \
    fakeroot \
    debhelper \
    dpkg-dev \
    automake \
    autotools-dev \
    autoconf \
    libtool \
    perl \
    libperl-dev \
    libipc-run-perl \
    libedit-dev \
    libssl-dev \
    zlib1g-dev \
    libselinux1-dev \
    libxslt1-dev \
    uuid-dev \
    python-dev \
    python3-dev \
    bison \
    flex \
    docbook-dsssl \
    docbook-xml \
    docbook-xsl \
    docbook \
    xsltproc \
    gettext \
    systemtap-sdt-dev \
    libssl-dev \
    libgss-dev \
 && rm -rf \
    /var/lib/apt/lists/*

COPY fake_root.py /usr/bin/fake_root
RUN chmod +x /usr/bin/fake_root


