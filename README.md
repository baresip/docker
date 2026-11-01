# docker

Docker Images for libre and baresip

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

### Host Networking

```bash
docker run --network host --rm -it baresip
```

### baresip-apps

The [baresip-apps](https://github.com/baresip/baresip-apps) image extends the
baresip image with additional modules (auloop, autotest, b2bua, calltimer,
ebuacip, intercom, kaoptions, multicast, parcall, qualify, redirect, vidloop,
...).

```bash
docker pull ghcr.io/baresip/docker/baresip-apps:latest
docker run --rm -it --volume=/home/user/.baresip:/root/.baresip baresip-apps
```

The extra modules are not loaded automatically. Enable them in your baresip
config with `module <name>.so` or `module_app <name>.so` lines, e.g.
`module b2bua.so`.

### Podman

All examples should work fine with podman too, just replace `docker` with
`podman`:

```bash
podman pull ghcr.io/baresip/docker/baresip:latest
podman run --rm -it baresip
```
