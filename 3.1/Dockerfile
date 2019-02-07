#We don't need the full JDK; JRE is plenty
FROM openjdk:8-jre-alpine
MAINTAINER tony.hirst@gmail.com

#Download a couple of required packages
RUN apk update && apk add --no-cache wget bash

ARG RELEASE=3.1
ENV RELEASE=$RELEASE

RUN wget --no-check-certificate https://github.com/OpenRefine/OpenRefine/releases/download/$RELEASE/openrefine-linux-$RELEASE.tar.gz
RUN tar -xzf openrefine-linux-$RELEASE.tar.gz  && rm openrefine-linux-$RELEASE.tar.gz
RUN mkdir /mnt/refine
VOLUME /mnt/refine
EXPOSE 3333
CMD openrefine-$RELEASE/refine -i 0.0.0.0 -d /mnt/refine

#Reference:

#Build with default version
#docker build -t psychemedia/openrefinedemo .

#Build with a specific version
#docker build -t psychemedia/openrefinedemo --build-arg RELEASE=3.1-beta .

##to peek inside the container:
# docker run -i -t psychemedia/openrefinedemo /bin/bash

##to run:
# docker run --rm -d -p 3333:3333 --name openrefine psychemedia/openrefinedemo

