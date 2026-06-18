# oci-podman

A minimal OCI image that packages [podman](https://github.com/podman-container-tools/podman) for use in devcontainer builds.

## What it does

The `Containerfile` downloads a pinned release of `podman` from GitHub and produces a scratch-based image containing only the binary. This keeps the image as small as possible with no runtime dependencies.

The image is built for `linux/amd64` and `linux/arm64` via GitHub Actions and published to the GitHub Container Registry at:

```
ghcr.io/thredd-platform/oci-podman:latest
```

## Usage

Copy the binary into your devcontainer image:

```dockerfile
COPY --from=ghcr.io/thredd-platform/oci-podman:latest / /
```

## Version updates

[Renovate](https://docs.renovatebot.com/) is configured to automatically open pull requests when new releases of `podman` are published, keeping `PODMAN_VERSION` in the `Containerfile` up to date.
