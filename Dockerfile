FROM ubuntu:16.04
MAINTAINER Peter Mescalchin <peter@magnetikonline.com>

ENV VERSION 2.0.3

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install checkinstall cmake libgcrypt20-dev libqt5x11extras5-dev make qt4-default qtbase5-dev qttools5-dev qttools5-dev-tools zlib1g-dev && \
	apt-get clean

ADD https://www.keepassx.org/releases/$VERSION/keepassx-$VERSION.tar.gz /root/build/
WORKDIR /root/build
RUN tar -xf keepassx-$VERSION.tar.gz

RUN mkdir -p /root/build/keepassx-$VERSION/build
WORKDIR /root/build/keepassx-$VERSION/build
RUN cmake .. && make

RUN echo "magnetikonline: KeePassX v$VERSION" >description-pak && \
	checkinstall -Dy --install=no --nodoc --pkgname=keepassx --pkgversion=$VERSION make -i install

CMD ["/bin/bash"]
