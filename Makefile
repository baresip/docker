LIBRE_GIT   := $(shell [ -f ../re/Makefile ] && \
	       git -C ../re rev-parse --short HEAD)
LIBREM_GIT  := $(shell [ -f ../rem/Makefile ] && \
	       git -C ../rem rev-parse --short HEAD)
BARESIP_GIT := $(shell [ -f ../baresip/Makefile ] && \
	       git -C ../baresip rev-parse --short HEAD)

.PHONY: update_dev
update_dev:
	@sed -i "s/VERSION_RE:.*/VERSION_RE: $(LIBRE_GIT)/" .github/workflows/dev.yml
	@sed -i "s/VERSION_REM:.*/VERSION_REM: $(LIBREM_GIT)/" .github/workflows/dev.yml
	@sed -i "s/VERSION_BARESIP:.*/VERSION_BARESIP: $(BARESIP_GIT)/" .github/workflows/dev.yml
	@sed -i "s/libre-dev:.*/libre-dev:$(LIBRE_GIT)/" librem/dev/Dockerfile
	@sed -i "s/librem-dev:.*/librem-dev:$(LIBREM_GIT)/" libbaresip/dev/Dockerfile
