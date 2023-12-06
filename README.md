# arcgis-api-python-docker

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![python](https://img.shields.io/badge/Python-3.11-3776AB.svg?style=flat&logo=python&logoColor=white)](https://www.python.org)

[![Push to Docker Hub](https://github.com/joshuasundance-swca/arcgis-api-python-docker/actions/workflows/docker-hub.yml/badge.svg)](https://github.com/joshuasundance-swca/arcgis-api-python-docker/actions/workflows/docker-hub.yml)
[![arcgis-api-python-docker on Docker Hub](https://img.shields.io/docker/v/joshuasundance/arcgis-api-python-docker?label=arcgis-api-python-docker&logo=docker)](https://hub.docker.com/r/joshuasundance/arcgis-api-python-docker)
[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/joshuasundance/arcgis-api-python-docker/latest)](https://hub.docker.com/r/joshuasundance/arcgis-api-python-docker)

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/charliermarsh/ruff/main/assets/badge/v1.json)](https://github.com/charliermarsh/ruff)
[![Checked with mypy](http://www.mypy-lang.org/static/mypy_badge.svg)](http://mypy-lang.org/)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

[![security: bandit](https://img.shields.io/badge/security-bandit-yellow.svg)](https://github.com/PyCQA/bandit)
![Known Vulnerabilities](https://snyk.io/test/github/joshuasundance-swca/arcgis-api-python-docker/badge.svg)

## Quickstart

The container will just run `/bin/bash` by default, but `arcgis` comes with Jupyter; to run Jupyter Lab, use the following examples:

### Using Docker
```bash
docker run -d --name arcgis-api-python-docker \
  -p 8888:8888 \
  joshuasundance/arcgis-api-python-docker:0.0.1 \
  jupyter lab --ip=0.0.0.0 --port=8888 --no-browser
```

### Using Docker Compose
```docker-compose.yml
version: '3.8'

services:
  jupyterlab:
    image: joshuasundance/arcgis-api-python-docker:0.0.1
    ports:
      - "${JUPYTER_PORT:-8888}:${JUPYTER_PORT:-8888}"
    volumes:
      - ./notebooks:/home/arcgisuser/notebooks
    working_dir: /home/arcgisuser/notebooks
    command: ["jupyter", "lab", "--ip=0.0.0.0", "--port=${JUPYTER_PORT:-8888}", "--no-browser"]
```
