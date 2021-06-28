FROM ghcr.io/baresip/docker/librem:latest
ARG version
WORKDIR /root/
RUN wget https://github.com/baresip/baresip/archive/refs/tags/v$version.tar.gz && \
    tar -xvzf v$version.tar.gz && \
    mv baresip-$version baresip
RUN cd baresip && make install DESTDIR=dist && cp -a dist/usr/* /usr/

FROM bitnami/minideb:buster
RUN install_packages libopus0 ca-certificates openssl
WORKDIR /root/
COPY --from=0 /root/re/dist/usr/ /usr/
COPY --from=0 /root/rem/dist/usr/ /usr/
COPY --from=0 /root/baresip/dist/usr/ /usr/
CMD ["/usr/bin/baresip"]
