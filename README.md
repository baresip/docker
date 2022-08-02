# docker

Docker Images for libre, librem and baresip

## Usage 

```bash
docker run --rm -it --volume=/home/user/.baresip:/baresip ghcr.io/baresip/docker/baresip:latest
```

### With alsa devices

```bash
docker run --rm -it --device=/dev/snd ghcr.io/baresip/docker/baresip:latest
```
