FROM ghcr.io/baresip/docker/librem:latest
ARG version
RUN install_packages libopus-dev
WORKDIR /root/
RUN wget https://github.com/baresip/baresip/archive/refs/tags/v$version.tar.gz && \
    tar -xvzf v$version.tar.gz && \
    mv baresip-$version baresip
RUN cd baresip && make install DESTDIR=dist && cp -a dist/usr/* /usr/
RUN cd baresip && make install-dev DESTDIR=dist && cp -a dist/usr/* /usr/
