# Cf. https://hub.docker.com/_/python
FROM python:3.12.0-bookworm

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "2023-10-09"
LABEL author "Florian Stosse"
LABEL description "Checksec.py v0.7.1, built using Python v3.12.0 Debian based image"
LABEL license "MIT license"

# Cf. https://pypi.org/project/checksec.py/
RUN pip3 install --upgrade pip &&\
    pip3 install checksec.py==0.7.1 --user
