# Cf. https://hub.docker.com/_/python
FROM python:3.10.1-bullseye

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "27-11-2021"
LABEL author "Florian Stosse"
LABEL description "Checksec.py v0.6.2, built using Python v3.10 Debian Bullseeye-based image"
LABEL license "MIT license"

# Cf. https://pypi.org/project/checksec.py/
RUN pip3 install checksec.py==0.6.2
