FROM bitnami/minideb:buster
ARG version
RUN install_packages build-essential pkg-config git libssl-dev wget ca-certificates
WORKDIR /root/
RUN wget https://github.com/baresip/re/archive/refs/tags/v$version.tar.gz && \
    tar -xvzf v$version.tar.gz && \
    mv re-$version re
RUN cd re && make install DESTDIR=dist && cp -a dist/usr/* /usr/
