ARG IMAGE=ghcr.io/baresip/docker/librem:latest
FROM ${IMAGE}
ARG VERSION
ARG RELEASE
RUN install_packages libopus-dev libasound2-dev libmosquitto-dev libspandsp-dev
WORKDIR /root/
RUN git clone https://github.com/baresip/baresip.git && \
    cd baresip && git checkout ${VERSION} && \
    make CC=clang-11 info install RELEASE=${RELEASE} DESTDIR=dist && cp -a dist/usr/* /usr/

# --- Final build image ---
FROM bitnami/minideb:buster
RUN install_packages libopus0 ca-certificates openssl libasound2 libmosquitto1 libspandsp2
COPY --from=0 /root/re/dist/usr/ /usr/
COPY --from=0 /root/rem/dist/usr/ /usr/
COPY --from=0 /root/baresip/dist/usr/ /usr/
WORKDIR /baresip
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["baresip", "-f", "/baresip"]
