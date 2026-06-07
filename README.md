# ghidra-python

Ghidra Python Images for devcontainers

## Available Images

All images are published to GitHub Container Registry at `ghcr.io/clearbluejar/ghidra-python`.

### Standard Images

Standard images are based on the full `mcr.microsoft.com/vscode/devcontainers/python` base image.

**Tag format:** `{ghidra-version}ghidra{python-version}python-{debian-codename}`

**Versioned tags are built from:**
- Ghidra: `12.1.2`, `12.0.4`, `11.4.3`, `11.3.2`
- Python: `3.13`, `3.12`, `3.11`, `3.10`
- Debian: `bookworm`, `trixie`
- Alias: `latest`

### Slim Images

Slim images use `python:slim-{debian-codename}` as the base instead of the full VS Code devcontainer image, resulting in **~30-40% smaller** image sizes while maintaining the same functionality.

**Features:**
- Same Ghidra and Python versions as standard images
- Same SDKMAN-based Java installation
- Multi-platform support (linux/amd64, linux/arm64)
- All devcontainer features work identically

**Tag format:** `{ghidra-version}ghidra{python-version}python-{debian-codename}-slim`

**Versioned tags are built from:**
- Ghidra: `12.1.2`, `12.0.3`, `11.4.3`, `11.3.2`
- Python: `3.13`, `3.12`, `3.11`, `3.10`
- Debian: `bookworm`, `trixie`
- Alias: `latest-slim`

## Usage

### Standard Image

```json
{
  "name": "Ghidra Python",
  "image": "ghcr.io/clearbluejar/ghidra-python:12.1.2ghidra3.13python-trixie"
}
```

### Slim Image

```json
{
  "name": "Ghidra Python Slim",
  "image": "ghcr.io/clearbluejar/ghidra-python:12.1.2ghidra3.13python-trixie-slim"
}
```

### Docker Run

```bash
# Standard image
docker run -it ghcr.io/clearbluejar/ghidra-python:12.1.2ghidra3.13python-trixie

# Slim image
docker run -it ghcr.io/clearbluejar/ghidra-python:12.1.2ghidra3.13python-trixie-slim
```

## Image Contents

All images include:
- Python (3.10, 3.11, 3.12, or 3.13)
- Java 21 (installed via SDKMAN)
- Gradle
- Ghidra versions from the build matrices above
- Git, curl, sudo, and other devcontainer essentials

## Size Comparison

| Variant | Estimated Size | Savings |
|---------|----------------|---------|
| Standard | ~1.5-2 GB | - |
| Slim | ~1.0-1.3 GB | ~30-40% |

## Building Locally

### Build Standard Image

```bash
export GHIDRA-BUILD-VER=12.1.2
export JAVA-BUILD-VER=21
export VARIANT=3.13-trixie
devcontainer build --workspace-folder . --config .devcontainer/devcontainer.json
```

### Build Slim Image

```bash
export GHIDRA-BUILD-VER=12.1.2
export JAVA-BUILD-VER=21
export VARIANT=3.13-slim-trixie
devcontainer build --workspace-folder . --config .devcontainer/devcontainer-slim.json
```

## Workflows

- **build-all-vers.yaml**: Builds all version combinations for standard images
- **build-latest.yaml**: Builds the `latest` tag for standard images
- **build-slim-all-vers.yaml**: Builds all version combinations for slim images
- **build-slim-latest.yaml**: Builds the `latest-slim` tag for slim images
