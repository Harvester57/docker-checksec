# Cf. https://hub.docker.com/_/python
FROM python:3.12.6-alpine3.20

LABEL maintainer "florian.stosse@gmail.com"
LABEL lastupdate "2024-09-15"
LABEL author "Florian Stosse"
LABEL description "Checksec.py v0.7.3, built using Python v3.12.6 Alpine based image"
LABEL license "MIT license"

# Cf. https://pypi.org/project/checksec.py/
RUN pip3 install --upgrade pip &&\
    pip3 install checksec.py==0.7.3 --user
