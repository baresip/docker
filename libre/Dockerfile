FROM bitnami/minideb:bullseye
ARG VERSION
ARG RELEASE
WORKDIR /root/
RUN install_packages clang-11 make cmake pkg-config git libssl-dev wget ca-certificates && \
    git clone https://github.com/baresip/re.git && \
    cd re && git checkout ${VERSION} && \
    make info install CC=clang-11 RELEASE=${RELEASE} DESTDIR=dist -j && cp -a dist/usr/* /usr/
