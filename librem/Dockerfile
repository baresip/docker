ARG IMAGE=ghcr.io/baresip/docker/libre:latest
FROM ${IMAGE}
ARG VERSION
WORKDIR /root/
RUN git clone https://github.com/baresip/rem.git && \
	cd rem && git checkout ${VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_COMPILER=clang-11 && \
    cmake --build build -j && \
    cmake --install build --prefix dist && cp -a dist/* /usr/
