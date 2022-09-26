FROM bitnami/minideb:bullseye
ARG VERSION
WORKDIR /root/
RUN install_packages clang-11 make cmake pkg-config git libssl-dev wget ca-certificates && \
    git clone https://github.com/baresip/re.git && \
    cd re && git checkout ${VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_COMPILER=clang-11 && \
    cmake --build build -j && \
    cmake --install build --prefix dist && cp -a dist/* /usr/
