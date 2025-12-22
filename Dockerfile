# Cf. https://hub.docker.com/_/python
FROM python:3.15.0a3-alpine@sha256:c7fcf93b725e5e2e9c506f1c20630e3617907cf9e68236a6873d2954a05bd9c1

LABEL maintainer="florian.stosse@gmail.com"
LABEL lastupdate="2025-07-17"
LABEL author="Florian Stosse"
LABEL description="Checksec.py v0.7.5, built using Python v3.13 Alpine based image"
LABEL license="MIT license"

RUN apk update && \
    apk upgrade --available

RUN addgroup -g 666 appuser && \
    mkdir -p /home/appuser && \
    adduser -D -h /home/appuser -u 666 -G appuser appuser && \
    chown -R appuser:appuser /home/appuser
ENV PATH="/home/appuser/.local/bin:${PATH}"
USER appuser
COPY requirements.txt .

# Cf. https://pypi.org/project/checksec.py/
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt --user --no-cache-dir

# Test run
RUN checksec --help

ENTRYPOINT [ "checksec" ]