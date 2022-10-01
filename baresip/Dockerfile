ARG IMAGE=ghcr.io/baresip/docker/librem:latest
FROM ${IMAGE}
ARG VERSION
RUN install_packages libopus-dev libasound2-dev libmosquitto-dev libspandsp-dev libpulse-dev
WORKDIR /root/
RUN git clone https://github.com/baresip/baresip.git && \
    cd baresip && git checkout ${VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_COMPILER=clang-11 -DCMAKE_CXX_COMPILER=clang++-11 && \
    cmake --build build -j && \
    cmake --install build --prefix dist && cp -a dist/* /usr/
RUN mkdir /root/dist && \
    cp -a /root/re/dist/* /root/dist/ && \
    cp -a /root/rem/dist/* /root/dist/ && \
    cp -a /root/baresip/dist/* /root/dist/

# --- Final build image ---
FROM bitnami/minideb:bullseye
RUN install_packages libopus0 ca-certificates openssl libasound2 libmosquitto1 libspandsp2 libpulse0 pulseaudio
COPY --from=0 /root/dist/usr/ /usr/
WORKDIR /root
USER root
ENV USER=root
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["baresip"]
