#We don't need the full JDK; JRE is plenty
FROM openjdk:8-jre
MAINTAINER tony.hirst@gmail.com

#Download a couple of required packages
RUN apt-get update && apt-get install -y --no-install-recommends wget bash

RUN apt-get install -y --no-install-recommends \
    python3.7 \	
    python3-pip \	
    && \	
    apt-get clean && \	
    rm -rf /var/lib/apt/lists/*

RUN pip3 install \
    jupyterhub \
    jhsingle-native-proxy>=0.0.9 \
    streamlit

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

EXPOSE 8888

ENTRYPOINT ["/home/jovyan/entrypoint.sh"]

CMD ["jhsingle-native-proxy", "openrefine-$RELEASE/refine", "{-i}", "0.0.0.0", "{-p}", "{port}", "{-}d", "/mnt/refine", "--port", "8888"]

#Reference:

#Build with default version
#docker build -t psychemedia/openrefinedemo .

#Build with a specific version
#docker build -t psychemedia/openrefinedemo --build-arg RELEASE=3.1-beta .

##to peek inside the container:
# docker run -i -t psychemedia/openrefinedemo /bin/bash

##to run:
# docker run --rm -d -p 3333:3333 --name openrefine psychemedia/openrefinedemo
