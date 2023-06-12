FROM bitnami/minideb:bullseye
ARG VERSION
WORKDIR /root/
RUN install_packages clang-11 make cmake pkg-config git libssl-dev wget ca-certificates libz-dev && \
    git clone -b ${VERSION} --single-branch https://github.com/baresip/re.git && \
    cd re && \
    cmake -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_COMPILER=clang-11 && \
    cmake --build build -j && \
    cmake --install build --prefix dist && cp -a dist/* /usr/
