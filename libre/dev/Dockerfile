FROM bitnami/minideb:buster
ARG version
RUN install_packages build-essential pkg-config git libssl-dev wget ca-certificates
WORKDIR /root/
RUN git clone https://github.com/baresip/re.git
RUN cd re && git checkout $version
RUN cd re && make install DESTDIR=dist && cp -a dist/usr/* /usr/
