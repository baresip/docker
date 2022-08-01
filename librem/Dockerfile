FROM ghcr.io/baresip/docker/libre:latest
ARG version
WORKDIR /root/
RUN wget https://github.com/baresip/rem/archive/refs/tags/v$version.tar.gz && \
	tar -xvzf v$version.tar.gz && rm v$version.tar.gz && \
	mv rem-$version rem && \
	cd rem && make install DESTDIR=dist && cp -a dist/usr/* /usr/
