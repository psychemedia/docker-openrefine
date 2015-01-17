# docker-openrefine

Dockerfile for OpenRefine - latest release version (OpenRefine 2.6 beta 1)

(For the latest build from github, see [psychemedia/openrefine](https://registry.hub.docker.com/u/psychemedia/openrefine/))

## Usage

In order to create the virtual machine, you should:

* install boot2docker
* run boot2docker
* *Either:* to run with a project directory solely within the container, in the boot2docker terminal, enter the command `docker run --name openrefine -d -p 3334:3333 psychemedia/docker-openrefine`
* *Or:* to run with a project directory mounted from a shared folder on the host, in the boot2docker terminal, enter the command `docker run -d -p 3334:3333 -v /path/to/yourSharedDirectory:/mnt/refine --name openrefine psychemedia/docker-openrefine`
* *Or*: to run with a project directory in a linked data volume, in the boot2docker terminal, enter the command `docker run -d -p 3334:3333 -v /mnt/refine --name openrefine psychemedia/docker-openrefine`

The port number you will be able to find OpenRefine on is given by the first number set in the flag `-p NNNN:3333`. To access OpenRefine via port 3334, use `-p 3334:3333` etc.

OpenRefine will then be available via your browser at the URL `http://IPADDRESS:NNNN`. To find the required value of `IPADDRESS` can be found using the command `boot2docker ip`
The returned IP address (eg 192.168.59.103) is the IP address you can find OpenRefine on, for example: `http://192.168.59.103:3334`.