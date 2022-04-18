# Cf. https://hub.docker.com/_/python
FROM python:3.7.13-slim-bullseye

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "2022-04-18"
LABEL author "Florian Stosse"
LABEL description "Checksec.py v0.6.2, built using Python v3.7.13 Debian Bullseye-based image"
LABEL license "MIT license"

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser
USER appuser

# Cf. https://pypi.org/project/checksec.py/
RUN pip3 install checksec.py==0.6.2
