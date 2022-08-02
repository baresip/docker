FROM bitnami/minideb:buster
ARG version
ARG release
WORKDIR /root/
RUN install_packages clang-11 make cmake pkg-config git libssl-dev wget ca-certificates && \
    git clone https://github.com/baresip/re.git && \
    cd re && git checkout ${version} && \
    make info install CC=clang-11 RELEASE=${release} DESTDIR=dist && cp -a dist/usr/* /usr/
