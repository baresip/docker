ARG IMAGE=ghcr.io/baresip/docker/librem:latest
FROM ${IMAGE}
ARG VERSION
ARG RELEASE
RUN install_packages libopus-dev libasound2-dev libmosquitto-dev libspandsp-dev
WORKDIR /root/
RUN git clone https://github.com/baresip/baresip.git && \
    cd baresip && git checkout ${VERSION} && \
    make CC=clang-11 info install RELEASE=${RELEASE} DESTDIR=dist -j
RUN mkdir /root/dist && \
    cp -a /root/re/dist/usr /root/dist/ && \
    cp -a /root/rem/dist/usr /root/dist/ && \
    cp -a /root/baresip/dist/usr /root/dist/

# --- Final build image ---
FROM bitnami/minideb:bullseye
RUN install_packages libopus0 ca-certificates openssl libasound2 libmosquitto1 libspandsp2
COPY --from=0 /root/dist/usr/ /usr/
WORKDIR /root
USER root
ENV USER=root
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["baresip"]
