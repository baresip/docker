FROM bitnami/minideb:bookworm
ARG VERSION
WORKDIR /root/
RUN install_packages clang-19 make cmake pkg-config git libssl-dev wget ca-certificates libz-dev && \
    git clone -b ${VERSION} --depth=1 https://github.com/baresip/re.git && \
    cd re && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="-g" -DCMAKE_C_COMPILER=clang-19 -DCMAKE_CXX_COMPILER=clang++-19 && \
    cmake --build build -j4 && \
    cmake --install build --prefix dist && cp -a dist/* /usr/
