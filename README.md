# ispyagentdvr-base-image

Base image for [iSpy Agent DVR](https://www.ispyconnect.com/) Docker builds with hardware-accelerated video processing.

## Features

- Debian Trixie Slim base
- Jellyfin FFmpeg with hardware acceleration support
- Intel GPU drivers (compute-runtime + IGC)
- VLC media framework
- Multi-architecture: `linux/amd64`, `linux/arm64`, `linux/arm/v7`

## Available Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest successful build |
| `trixie-slim-vlc-jellyfin-ffmpeg-7.1.3-3-intel-26.05.37020.3` | Version-pinned rolling tag |
| `trixie-slim-vlc-jellyfin-ffmpeg-7.1.3-3-intel-26.05.37020.3-DDMMYYYY` | Date-stamped build |

## Usage

```bash
docker pull mekayelanik/ispyagentdvr-base-image:latest
```

## Upstream Sources

This image tracks two upstream repositories for new releases:

| Component | Repository | Current Version |
|-----------|------------|-----------------|
| Jellyfin FFmpeg | [jellyfin/jellyfin-ffmpeg](https://github.com/jellyfin/jellyfin-ffmpeg/releases) | 7.1.3-3 |
| Intel Compute Runtime | [intel/compute-runtime](https://github.com/intel/compute-runtime/releases) | 26.05.37020.3 |
| Intel Graphics Compiler | [intel/intel-graphics-compiler](https://github.com/intel/intel-graphics-compiler/releases) | 2.28.4 |

A new image build is triggered automatically when either upstream repository publishes a new release (jellyfin-ffmpeg must include `.deb` assets).

## Registries

- **Docker Hub:** [`mekayelanik/ispyagentdvr-base-image`](https://hub.docker.com/r/mekayelanik/ispyagentdvr-base-image)
- **GHCR:** `ghcr.io/mekayelanik/ispyagentdvr-base-image`

## Pipeline

Automated CI/CD pipeline monitors upstream releases via external cron trigger (`repository_dispatch`). Builds are multi-arch with ZSTD compression, dual-registry push, and Trivy security scanning.

Manual triggers available via `workflow_dispatch` with options for forced builds, version overrides, and registry selection.
