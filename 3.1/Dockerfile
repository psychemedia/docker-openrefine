FROM maven:3.6.0-jdk-8-alpine
MAINTAINER tony.hirst@gmail.com

ARG RELEASE=3.1
ENV RELEASE=$RELEASE

RUN wget --no-check-certificate https://github.com/OpenRefine/OpenRefine/releas$
RUN tar -xzf openrefine-linux-$RELEASE.tar.gz  && rm openrefine-linux-$RELEASE.$
RUN mkdir /mnt/refine
VOLUME /mnt/refine
EXPOSE 3333
CMD openrefine-$RELEASE/refine -i 0.0.0.0 -d /mnt/refine

#Reference:

##to build, cd into the directory containing this Dockerfile, and run:
# docker build -t psychemedia/openrefinedemo .

##to peek inside the container:
# docker run -i -t psychemedia/openrefinedemo /bin/bash

##to run:
# docker run --rm -d -p 3333:3333 --name openrefine psychemedia/openrefinedemo

#to push:
# docker push psychemedia/openrefinedemo
