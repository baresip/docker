ARG IMAGE=ghcr.io/baresip/docker/libre:latest
FROM ${IMAGE}
ARG VERSION
ARG RELEASE
WORKDIR /root/
RUN git clone https://github.com/baresip/rem.git && \
	cd rem && git checkout ${VERSION} && \
	make CC=clang-11 info install RELEASE=${RELEASE} DESTDIR=dist && cp -a dist/usr/* /usr/
