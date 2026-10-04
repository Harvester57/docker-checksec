FROM dhi.io/python:3.13-alpine3.23-dev@sha256:bbf813558dbe39eedc7a6618e060cd30a6f6caaff1c6988ca11bea51c1ef27c2 AS builder

ENV LANG=C.UTF-8 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    TZ="Europe/Paris"

WORKDIR /checksec
COPY requirements.txt .
RUN python -m venv venv
ENV PATH="/checksec/venv/bin:$PATH"

RUN pip install -r /checksec/requirements.txt --no-cache-dir

FROM dhi.io/python:3.13-alpine3.23@sha256:57086061ff6bbc72b36432a2ab24c73c44a423e8715a9bcfe0a4d162a3cbc3d1

LABEL org.opencontainers.image.authors="Florian Stosse <florian.stosse@gmail.com>"
LABEL org.opencontainers.image.created="2026-02-20"
LABEL org.opencontainers.image.description="Checksec.py v0.7.5, built using Docker Hardened Image Python v3.23 Alpine based image"
LABEL org.opencontainers.image.licenses="MIT license"

WORKDIR /venv

ENV LANG=C.UTF-8 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    TZ="Europe/Paris" \
    PATH="/venv/bin:$PATH"

COPY --from=builder /checksec/venv /venv

ENTRYPOINT [ "python3", "/venv/bin/checksec" ]
