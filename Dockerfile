# Cf. https://hub.docker.com/_/python
FROM python:3.11.1-slim-bullseye

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "2022-12-09"
LABEL author "Florian Stosse"
LABEL description "Checksec.py v0.6.2, built using Python v3.11.1 Debian Bullseye-based image"
LABEL license "MIT license"

RUN addgroup -g 666 appuser && \
    mkdir -p /home/appuser && \
    adduser -D -h /home/appuser -u 666 -G appuser appuser && \
    chown -R appuser:appuser /home/appuser
ENV PATH="/home/appuser/.local/bin:${PATH}"
USER appuser

# Cf. https://pypi.org/project/checksec.py/
RUN pip3 install --upgrade pip &&\
    pip3 install checksec.py==0.6.2 --user
