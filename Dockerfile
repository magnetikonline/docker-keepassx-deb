FROM ubuntu:14.04.3
MAINTAINER Peter Mescalchin <peter@magnetikonline.com>

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install checkinstall cmake libgcrypt20-dev libqt5x11extras5-dev make qt4-default qtbase5-dev qttools5-dev qttools5-dev-tools zlib1g-dev
RUN apt-get clean

ADD https://www.keepassx.org/releases/2.0/keepassx-2.0.tar.gz /root/build/
WORKDIR /root/build
RUN tar -xf keepassx-2.0.tar.gz

RUN mkdir -p /root/build/keepassx-2.0/build
WORKDIR /root/build/keepassx-2.0/build
RUN cmake .. && make

RUN echo "magnetikonline: KeePassX v2.0" > description-pak && \
	checkinstall -Dy --install=no --nodoc --pkgname=keepassx --pkgversion=2.0 make -i install

CMD ["/bin/bash"]
