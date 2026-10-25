# ghidra-python

Ghidra Python Images for devcontainers

## Available Images

All images are published to GitHub Container Registry at `ghcr.io/clearbluejar/ghidra-python`.

### Standard Images

Standard images are based on the full `mcr.microsoft.com/vscode/devcontainers/python` base image.

**Tag format:** `{ghidra-version}ghidra{python-version}python-{debian-codename}`

**Versioned tags are built from:**
- Ghidra: `12.2`, `12.1.4`, `12.0.4`, `11.4.3`, `11.3.2`
- Python: `3.13`, `3.12`, `3.11`, `3.10`
- Debian: `bookworm`, `trixie`
- Alias: `latest`

The JDK follows the Ghidra release (`application.java.min`): 25 for Ghidra 12.2 and `latest`, 21 for older versions.

### Slim Images

Slim images use `python:slim-{debian-codename}` as the base instead of the full VS Code devcontainer image, resulting in **~30-40% smaller** image sizes while maintaining the same functionality.

**Features:**
- Same Ghidra and Python versions as standard images
- Same SDKMAN-based Java installation
- Multi-platform support (linux/amd64, linux/arm64)
- All devcontainer features work identically

**Tag format:** `{ghidra-version}ghidra{python-version}python-{debian-codename}-slim`

**Versioned tags are built from:**
- Ghidra: `12.2`, `12.1.4`, `12.0.4`, `11.4.3`, `11.3.2`
- Python: `3.13`, `3.12`, `3.11`, `3.10`
- Debian: `bookworm`, `trixie`
- Alias: `latest-slim`

## Usage

To run a patched decompiler (e.g. diff-stable default variable names for binary diffing) on top of these
images, layer the [ghidra-decompiler-patch](https://github.com/clearbluejar/features/tree/main/src/ghidra-decompiler-patch)
feature in your own devcontainer instead of building a separate image:

```json
{
  "image": "ghcr.io/clearbluejar/ghidra-python:12.2ghidra3.13python-bookworm",
  "features": { "ghcr.io/clearbluejar/features/ghidra-decompiler-patch:1": {} }
}
```

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
- Java 21 or 25 (installed via SDKMAN; matches the Ghidra release's minimum)
- Gradle
- Ghidra versions from the build matrices above, with native binaries built from source on linux/arm64
- `GHIDRA_INSTALL_DIR` and `GHIDRA_VERSION` exported for interactive and login shells (`/etc/profile.d/ghidra.sh`)
- Git, curl, sudo, and other devcontainer essentials

## Size Comparison

| Variant | Estimated Size | Savings |
|---------|----------------|---------|
| Standard | ~1.5-2 GB | - |
| Slim | ~1.0-1.3 GB | ~30-40% |

## Building Locally

### Build Standard Image

```bash
export GHIDRA-BUILD-VER=12.2
export JAVA-BUILD-VER=25
export VARIANT=3.13-trixie
devcontainer build --workspace-folder . --config .devcontainer/devcontainer.json
```

### Build Slim Image

```bash
export GHIDRA-BUILD-VER=12.2
export JAVA-BUILD-VER=25
export VARIANT=3.13-slim-trixie
devcontainer build --workspace-folder . --config .devcontainer/devcontainer-slim.json
```

## Workflows

- **build-all-vers.yaml**: Builds all version combinations for standard images. Runs on pushes that touch
  `.devcontainer/`; `workflow_dispatch` accepts JSON lists `ghidra_versions` / `python_versions` to build a
  subset (default: just the newest Ghidra), e.g. when a new Ghidra release comes out.
- **build-slim-all-vers.yaml**: Same for slim images.
- **build-latest.yml** / **build-slim-latest.yaml**: Build the `latest` / `latest-slim` tags after a successful
  full build, on dispatch, and weekly on a schedule so they follow new Ghidra releases.
