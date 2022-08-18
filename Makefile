TARGETS := $(shell ls scripts)
version = $(shell git log -n 1 --date=short --pretty=format:%cs.%h)

.PHONY: build
build:
	unset DOCKER_HOST && docker buildx build \
		--platform linux/arm64,linux/amd64 \
		--tag ghcr.io/darkmuggle/shared-local-path:${version} \
		--output "type=image,push=true" \
		--no-cache \
		-f Dockerfile .
