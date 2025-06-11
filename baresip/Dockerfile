ARG IMAGE=ghcr.io/baresip/docker/libre:latest
FROM ${IMAGE}
ARG VERSION
RUN install_packages clang-19 libopus-dev libasound2-dev libmosquitto-dev libspandsp-dev libpulse-dev
WORKDIR /root/
RUN git clone -b ${VERSION} --depth=1 https://github.com/baresip/baresip.git && \
    cd baresip && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="-g" -DCMAKE_CXX_FLAGS="-g" -DCMAKE_C_COMPILER=clang-19 \
        -DCMAKE_CXX_COMPILER=clang++-19 -DCMAKE_INSTALL_PREFIX=/usr && \
    cmake --build build -j4 && \
    cmake --install build --prefix dist && cp -a dist/* /usr/
RUN mkdir -p /root/dist/usr && \
    cp -a /root/re/dist/* /root/dist/usr/ && \
    cp -a /root/baresip/dist/* /root/dist/usr/

# --- Final build image ---
FROM bitnami/minideb:bookworm
RUN install_packages libopus0 ca-certificates openssl libasound2 libmosquitto1 libspandsp2 libpulse0 pulseaudio
COPY --from=0 /root/dist/usr/ /usr/
WORKDIR /root
USER root
ENV USER=root
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["baresip"]
