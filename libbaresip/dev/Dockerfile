FROM ghcr.io/baresip/docker/librem-dev:960cdb7
ARG version
WORKDIR /root/
RUN git clone https://github.com/baresip/baresip.git
RUN cd baresip && git checkout $version
RUN cd baresip && make install DESTDIR=dist && cp -a dist/usr/* /usr/
