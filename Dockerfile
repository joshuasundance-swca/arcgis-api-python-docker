FROM python:3.11-slim-bookworm AS prereq
USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libkrb5-dev \
        gcc \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -g 1000 arcgisgroup \
    && adduser --uid 1000 --gid 1000 --disabled-password --gecos '' arcgisuser
USER 1000
RUN python -m pip install --user --no-cache-dir --upgrade pip


FROM prereq AS base
COPY ./requirements.txt /home/arcgisuser/requirements.txt
RUN python -m pip install --user --no-cache-dir -r /home/arcgisuser/requirements.txt
USER root
RUN apt-get clean -y \
    && apt-get purge -y --auto-remove \
        build-essential \
        libkrb5-dev \
        gcc \
    && rm -rf /var/lib/apt/lists/*
USER 1000
ENV HOME="/home/arcgisuser" \
    PATH="/home/arcgisuser/.local/bin:${PATH}" \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1


FROM base AS test
COPY ./tests/requirements.txt /home/arcgisuser/tests/requirements.txt
RUN python -m pip install --user --no-cache-dir -r /home/arcgisuser/tests/requirements.txt
COPY ./tests/*.py /home/arcgisuser/tests/
WORKDIR /home/arcgisuser/tests/
CMD ["pytest", "-v", "-s", "-p", "no:cacheprovider"]


FROM base AS runtime
WORKDIR /home/arcgisuser/
CMD ["/bin/bash"]
