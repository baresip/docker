ARG IMAGE=ghcr.io/baresip/docker/libre:latest
FROM ${IMAGE}
ARG VERSION
ARG RELEASE
WORKDIR /root/
RUN git clone -b ${VERSION} --depth=1 https://github.com/baresip/restund.git && \
    cd restund && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="-g" -DCMAKE_C_COMPILER=clang-15 \
        -DCMAKE_INSTALL_PREFIX=/usr -DSTATIC=1 && \
    cmake --build build -j && \
    cmake --install build --prefix dist
RUN mkdir /root/dist && \
    cp -a /root/re/dist/usr /root/dist/

# --- Final build image ---
FROM bitnami/minideb:bullseye
RUN install_packages ca-certificates openssl
COPY --from=0 /root/dist/usr/ /usr/
COPY --from=0 /root/restund/ /
WORKDIR /root
USER root
ENV USER=root
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["restund", "-n"]
