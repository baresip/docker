FROM ghcr.io/baresip/docker/librem:latest
ARG version
RUN install_packages libopus-dev libasound2-dev
WORKDIR /root/
RUN wget https://github.com/baresip/baresip/archive/refs/tags/v$version.tar.gz && \
    tar -xvzf v$version.tar.gz && \
    mv baresip-$version baresip
RUN cd baresip && make install DESTDIR=dist && cp -a dist/usr/* /usr/

# --- Final build image ---
FROM bitnami/minideb:buster
RUN install_packages libopus0 ca-certificates openssl libasound2
COPY --from=0 /root/re/dist/usr/ /usr/
COPY --from=0 /root/rem/dist/usr/ /usr/
COPY --from=0 /root/baresip/dist/usr/ /usr/
WORKDIR /baresip
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["baresip", "-f", "/baresip"]
