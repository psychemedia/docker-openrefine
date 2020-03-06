#We don't need the full JDK; JRE is plenty
FROM openjdk:8-jre
MAINTAINER tony.hirst@gmail.com

#Download a couple of required packages
RUN apt-get update && apt-get install -y --no-install-recommends wget bash git

RUN apt-get install -y --no-install-recommends \
    python3.7 \	
    python3-dev \
    python3-pip python3-venv python3-wheel python3-setuptools \
    build-essential cmake \
    git openssh-client \
    libssl-dev libffi-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
    jupyterhub \
    git+https://github.com/ideonate/jhsingle-native-proxy.git

ARG RELEASE=3.1
ENV RELEASE=$RELEASE

RUN wget --no-check-certificate https://github.com/OpenRefine/OpenRefine/releases/download/$RELEASE/openrefine-linux-$RELEASE.tar.gz
RUN tar -xzf openrefine-linux-$RELEASE.tar.gz  && rm openrefine-linux-$RELEASE.tar.gz
RUN mkdir /mnt/refine
VOLUME /mnt/refine
#EXPOSE 3333
#CMD openrefine-$RELEASE/refine -i 0.0.0.0 -d /mnt/refine

# create a user, since we don't want to run as root
RUN useradd -m jovyan
ENV HOME=/home/jovyan
WORKDIR $HOME
USER jovyan

COPY --chown=jovyan:jovyan entrypoint.sh /home/jovyan
RUN mkdir -p /home/jovyan/refine
EXPOSE 8888

ENTRYPOINT ["/home/jovyan/entrypoint.sh"]

CMD ["jhsingle-native-proxy", "openrefine-$RELEASE/refine", "{-i}", "0.0.0.0", "{-p}", "{port}", "{-}d", "/home/jovyan/refine", "--port", "8888"]

#Reference:

#Build with default version
#docker build -t psychemedia/openrefinedemo .

#Build with a specific version
#docker build -t psychemedia/openrefinedemo --build-arg RELEASE=3.1-beta .

##to peek inside the container:
# docker run -i -t psychemedia/openrefinedemo /bin/bash

##to run:
# docker run --rm -d -p 3333:3333 --name openrefine psychemedia/openrefinedemo
