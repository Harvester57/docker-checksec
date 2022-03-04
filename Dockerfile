# Cf. https://hub.docker.com/_/python
FROM python:3.7.12-slim-bullseye

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "2022-03-04"
LABEL author "Florian Stosse"
LABEL description "Checksec.py v0.6.2, built using Python v3.7.12 Debian Bullseeye-based image"
LABEL license "MIT license"

# Cf. https://pypi.org/project/checksec.py/
RUN pip3 install checksec.py==0.6.2
