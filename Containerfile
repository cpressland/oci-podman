FROM docker.io/alpine:3 AS build
ARG TARGETARCH
ARG PODMAN_VERSION=5.8.2

RUN apk add curl ca-certificates tar gzip

RUN curl -fSsL \
    "https://github.com/podman-container-tools/podman/releases/download/v${PODMAN_VERSION}/podman-remote-static-linux_${TARGETARCH}.tar.gz" | \
    tar -xz --strip-components=1 --no-same-owner --transform 's/podman-.*/podman/' -C /usr/local/bin/

FROM scratch
COPY --from=build /usr/local/bin/podman /usr/local/bin/podman
