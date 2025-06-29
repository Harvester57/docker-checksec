# Dockerized checksec.py

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This repository provides a `Dockerfile` to build a lightweight container image for `checksec.py`, a tool used to check the security properties of ELF binaries.

The image is based on `python:3.12-alpine` and runs as a non-root user for enhanced security.

## Image Details

*   **`checksec.py` version:** `0.7.4`
*   **Base Image:** `python:3.12-alpine`
*   **User:** `appuser` (UID/GID 666)

## Prerequisites

You must have Docker installed on your system.

## Building the Image

To build the Docker image, clone this repository and run the following command from the root directory:

```bash
docker build -t checksec-py .
```

## Usage

To use the `checksec.py` tool on a binary from your host machine, you need to mount the file or its parent directory into the container. The container's entrypoint is configured to pass commands directly to `checksec.py`.

### Checking a Single File

Mount the current directory to `/data` inside the container and specify the file to check.

```bash
# Assuming 'my_binary' is in your current directory
docker run --rm -v "$(pwd):/data:ro" checksec-py --file /data/my_binary
```
> **Note:** The `:ro` flag mounts the directory in read-only mode, which is a good security practice as the container cannot modify your host files.

### Checking a Directory

You can also check all valid binaries within a directory.

```bash
docker run --rm -v "$(pwd):/data:ro" checksec-py --dir /data
```

## License

This project is licensed under the MIT License.