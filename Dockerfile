# Cf. https://hub.docker.com/_/python
FROM python:3.12-alpine@sha256:9d28d9359a43bdfeb0ca4deb4722b5f88514a4646000b7357f43ee0316e425fa

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
COPY requirements.txt .

# Cf. https://pypi.org/project/checksec.py/
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt --user --no-cache-dir

# Test run
RUN checksec --help

ENTRYPOINT [ "checksec" ]