ARG IMAGE=ghcr.io/baresip/docker/libre:latest
FROM ${IMAGE}
ARG VERSION
ARG RELEASE
WORKDIR /root/
RUN git clone -b ${VERSION} --depth=1 https://github.com/baresip/restund.git && \
    cd restund && \
    cmake -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_COMPILER=clang-11 \
        -DCMAKE_CXX_COMPILER=clang++-11 -DCMAKE_INSTALL_PREFIX=/usr && \
    cmake --build build -j && \
    cmake --install build --prefix dist && cp -a dist/* /usr/
RUN mkdir /root/dist && \
    cp -a /root/re/dist/usr /root/dist/ && \
    cp -a /root/restund/dist/usr /root/dist/

# --- Final build image ---
FROM bitnami/minideb:bullseye
RUN install_packages ca-certificates openssl
COPY --from=0 /root/dist/usr/ /usr/
COPY --from=0 /root/restund/etc/ /etc/
WORKDIR /root
USER root
ENV USER=root
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["restund", "-n"]
