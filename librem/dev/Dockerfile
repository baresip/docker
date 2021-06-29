FROM ghcr.io/baresip/docker/libre-dev:f58ec9b
ARG version
WORKDIR /root/
RUN git clone https://github.com/baresip/rem.git
RUN cd rem && git checkout $version
RUN cd rem && make install DESTDIR=dist && cp -a dist/usr/* /usr/
