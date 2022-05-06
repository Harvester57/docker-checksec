# Cf. https://hub.docker.com/_/python
FROM python:3.7.13-slim-bullseye

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "2022-05-06"
LABEL author "Florian Stosse"
LABEL description "Checksec.py v0.6.2, built using Python v3.7.13 Debian Bullseye-based image"
LABEL license "MIT license"

RUN ls -ailh

RUN groupadd -g 999 appuser && \
    mkdir -p /home/appuser && \
    useradd -r -d /home/appuser -u 999 -g appuser appuser && \
    chown -R appuser:appuser /home/appuser
ENV PATH="/home/appuser/.local/bin:${PATH}"
USER appuser

# Cf. https://pypi.org/project/checksec.py/
RUN ls -ailh && pip3 install --upgrade pip &&\
    pip3 install -r requirements.txt --user
