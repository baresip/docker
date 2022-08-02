# docker

Docker Images for libre, librem and baresip

## Usage 

### Run latest stable version
```bash
docker pull ghcr.io/baresip/docker/baresip:latest
docker run --rm -it baresip
```

### Run latest dev version
```bash
docker pull ghcr.io/baresip/docker/baresip-dev:latest
docker run --rm -it baresip-dev
```

### Baresip cli options
```bash
docker run --rm -it baresip baresip -h
docker run --rm -it baresip baresip -v
docker run --rm -it baresip baresip -4
```

### Mount config path
```bash
docker run --rm -it --volume=/home/user/.baresip:/root/.baresip baresip
```

### With alsa devices

```bash
docker run --rm -it --device=/dev/snd baresip
```

### Podman

All examples should work fine with podman too, just replace `docker` with
`podman`:

```bash
podman pull ghcr.io/baresip/docker/baresip:latest
podman run --rm -it baresip
```
