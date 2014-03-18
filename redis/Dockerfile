# Install redis from wheezy Backports

FROM debian:wheezy
MAINTAINER nuit <nuit@hoeja.de>

RUN apt-get update
RUN apt-get upgrade -y

RUN echo "deb http://ftp.de.debian.org/debian/ wheezy-backports main non-free contrib" > /etc/apt/sources.list.d/wheezy-backports.list
RUN echo "deb-src http://ftp.de.debian.org/debian/ wheezy-backports main non-free contrib" >> /etc/apt/sources.list.d/wheezy-backports.list

RUN apt-get update                                                              
RUN apt-get upgrade -y

RUN apt-get -t wheezy-backports install -y redis-server

EXPOSE 6379

ENTRYPOINT ["redis-server"]
