FROM python:3.9-buster

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "30-01-2021"
LABEL author "Florian Stosse"
LABEL description "Checksec.py v0.6.1, built using Python v3.9 Alpine-based image"
LABEL license "MIT license"

# Cf. https://pypi.org/project/checksec.py/
RUN pip3 install checksec.py==0.6.1
