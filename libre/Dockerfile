FROM bitnami/minideb:buster
ARG version
WORKDIR /root/
RUN install_packages build-essential pkg-config git libssl-dev wget ca-certificates && \
    wget https://github.com/baresip/re/archive/refs/tags/v$version.tar.gz && \
    tar -xvzf v$version.tar.gz && \
    mv re-$version re && \
    cd re && make install DESTDIR=dist && cp -a dist/usr/* /usr/
