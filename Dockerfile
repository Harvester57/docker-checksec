# Cf. https://hub.docker.com/_/python
FROM python:3.11.8-alpine3.18

LABEL maintainer "florian.stosse@gmail.com"
LABEL lastupdate "2024-02-09"
LABEL author "Florian Stosse"
LABEL description "Checksec.py v0.7.1, built using Python v3.11.8 Alpine based image"
LABEL license "MIT license"

# Cf. https://pypi.org/project/checksec.py/
RUN pip3 install --upgrade pip &&\
    pip3 install checksec.py==0.6.2 --user
