FROM ghcr.io/baresip/docker/librem-dev:277a9d9
ARG version
RUN install_packages libopus-dev
WORKDIR /root/
RUN git clone https://github.com/baresip/baresip.git
RUN cd baresip && git checkout $version
RUN cd baresip && make install DESTDIR=dist && cp -a dist/usr/* /usr/
RUN cd baresip && make install-dev DESTDIR=dist && cp -a dist/usr/* /usr/
