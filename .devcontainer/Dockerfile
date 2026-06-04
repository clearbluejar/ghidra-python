# https://github.com/devcontainers/images/blob/3de4f2f5e967b9a2d3fde115e0c05909c0f373fe/src/python/.devcontainer/Dockerfile#L1

# [Choice] Python version (use -trixie, -bookworm, or -bullseye variants on local arm64/Apple Silicon): 3, 3.13, 3.12, 3.11, 3.10, 3.13-trixie, 3.12-trixie, 3.11-trixie, 3.10-trixie, 3-bookworm, 3.13-bookworm, 3.12-bookworm, 3.11-bookworm, 3.10-bookworm, 3-bullseye, 3.11-bullseye, 3.10-bullseye
ARG VARIANT=3-bookworm
FROM mcr.microsoft.com/vscode/devcontainers/python:${VARIANT}

# [Optional] If your pip requirements rarely change, uncomment this section to add them to the image.
# COPY requirements.txt /tmp/pip-tmp/
# RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
#    && rm -rf /tmp/pip-tmp

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1
