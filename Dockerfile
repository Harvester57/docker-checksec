# Cf. https://hub.docker.com/_/python
FROM python:3.12-alpine@sha256:c610e4a94a0e8b888b4b225bfc0e6b59dee607b1e61fb63ff3926083ff617216

LABEL maintainer="florian.stosse@gmail.com"
LABEL lastupdate="2025-06-22"
LABEL author="Florian Stosse"
LABEL description="Checksec.py v0.7.4, built using Python v3.12 Alpine based image"
LABEL license="MIT license"

RUN apk update && \
    apk upgrade --available

RUN addgroup -g 666 appuser && \
    mkdir -p /home/appuser && \
    adduser -D -h /home/appuser -u 666 -G appuser appuser && \
    chown -R appuser:appuser /home/appuser
ENV PATH="/home/appuser/.local/bin:${PATH}"
USER appuser

# Cf. https://pypi.org/project/checksec.py/
RUN pip3 install --upgrade pip &&\
    pip3 install checksec.py==0.7.4 --user --no-cache-dir