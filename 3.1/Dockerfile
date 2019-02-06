FROM maven:3.6.0-jdk-8-alpine
MAINTAINER tony.hirst@gmail.com

ARG RELEASE=3.1
ENV RELEASE=$RELEASE

RUN wget --no-check-certificate https://github.com/OpenRefine/OpenRefine/releases/download/3.1/openrefine-linux-$RELEASE.tar.gz
RUN tar -xzf openrefine-linux-$RELEASE.tar.gz  && rm openrefine-linux-$RELEASE.tar.gz
RUN mkdir /mnt/refine
VOLUME /mnt/refine
EXPOSE 3333
CMD openrefine-$RELEASE/refine -i 0.0.0.0 -d /mnt/refine

#Reference:
##to peek inside the container:
# docker run -i -t psychemedia/openrefinetest /bin/bash

##to run:
# docker run --rm -d -p 3333:3333 --name openrefine psychemedia/openrefinedemo

