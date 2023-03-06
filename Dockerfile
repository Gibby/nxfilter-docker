FROM ubuntu:latest

ENV TZ='America/New_York'
ENV VERSION='4.6.5.3'

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends dnsutils iputils-ping tzdata curl openjdk-11-jre-headless unzip && \
    cd /tmp && \
    curl http://pub.nxfilter.org/nxfilter-"${VERSION}".deb -o nxfilter.deb && \
    apt -y install --no-install-recommends ./nxfilter.deb && \
    curl http://pub.nxfilter.org/nxfilter-"${VERSION}".zip -o nxfilter.zip && \
    unzip nxfilter.zip && \
    cp -a conf /root/ && \
    apt-get -y purge curl unzip && \
    apt-get clean && \
    rm -fr /var/lib/apt/lists/* && \
    rm -fr /tmp/*

COPY start.sh /start.sh
EXPOSE 53/udp 19004/udp 80 443 19002 19003 19004

CMD ["/start.sh"]
