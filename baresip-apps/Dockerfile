ARG IMAGE=ghcr.io/baresip/docker/baresip:latest
FROM ${IMAGE}
ARG VERSION
RUN apt update && apt install -y clang-19 make cmake pkg-config git libssl-dev libz-dev
WORKDIR /root/
RUN git clone -b ${VERSION} --depth=1 https://github.com/baresip/baresip-apps.git && \
    cd baresip-apps && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="-g" -DCMAKE_CXX_FLAGS="-g" -DCMAKE_C_COMPILER=clang-19 \
        -DCMAKE_CXX_COMPILER=clang++-19 -DCMAKE_INSTALL_PREFIX=/usr && \
    cmake --build build -j4 && \
    cmake --install build --prefix dist/usr

# --- Final image: baresip overlay with baresip-apps modules ---
FROM ${IMAGE}
COPY --from=0 /root/baresip-apps/dist/usr/ /usr/
