FROM gcc:7

RUN set -ex; \
	apt-get update; \
# make sure debconf doesn't try to prompt (e.g. tzdata on Ubuntu)
	DEBIAN_FRONTEND=noninteractive \
	apt-get install -y \
		wget \
		gzip

RUN wget http://www-tcad.stanford.edu/oldftp_sw/Speedie/speedie03DEC.tar.Z
RUN gunzip speedie03DEC.tar.Z 
RUN tar -xvf speedie03DEC.tar

WORKDIR /speedie03DEC/depopro
RUN make all

WORKDIR /speedie03DEC/etchpro
RUN make all

WORKDIR /speedie03DEC/iontrans
RUN make all
