FROM dhi.io/python:3-alpine3.23-dev@sha256:2069ad97587fb9356c4b736be1839b182ca346eb193c14b5f53f8822eb1af62c AS builder

ENV LANG=C.UTF-8 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    TZ="Europe/Paris"

WORKDIR /checksec
COPY requirements.txt .
RUN python -m venv venv
ENV PATH="/checksec/venv/bin:$PATH"

RUN pip install -r /checksec/requirements.txt --no-cache-dir

FROM dhi.io/python:3-alpine3.23@sha256:103fa51b0bb61180edb7fc04cf41a63362b40764d3a06c88a099a62718a6bcd6

LABEL maintainer="florian.stosse@gmail.com"
LABEL lastupdate="2026-02-20"
LABEL author="Florian Stosse"
LABEL description="Checksec.py v0.7.5, built using Docker Hardened Image Python v3.23 Alpine based image"
LABEL license="MIT license"

WORKDIR /venv

ENV LANG=C.UTF-8 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    TZ="Europe/Paris"

COPY --from=builder /checksec/venv /venv

ENV PATH="/venv/bin:$PATH"

# Test run
RUN checksec --help

ENTRYPOINT [ "checksec" ]
