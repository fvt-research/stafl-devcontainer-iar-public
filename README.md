# Stafl DevContainer - IAR

## Introduction

This devcontainer is based on [StaflSystems/stafl-devcontainer](https://github.com/StaflSystems/stafl-devcontainer) but adds
IAR Build Tools for ARM.

## Building the Container

- Place the `.deb` file(s) for _IAR Build Tools for ARM_ in `stafl-devcontainer-iar/iar`
- If available, pleace the `.deb` file for _Axivion_ in `stafl-devcontainer-iar/axivion`. Place the `.key` license file alongside it.
- Run `docker build stafl-devcontainer-iar -t stafl-devcontainer-iar:latest`
    - Add `--build-arg BXARM=fs` to build the container with the FuSa version of _IAR Build Tools for ARM_.

## License Setup

Run the following commands inside the container to set up the IAR license:
```sh
PACKAGE_DIR=$(find /opt/iarsystems -type l)
LICENSE_SERVER="<some hostname or IP address>"
${PACKAGE_DIR}/common/bin/lightlicensemanager setup -s ${LICENSE_SERVER}
```

## Use with VSCode

- Follow comments in `.devcontainer/devcontainer.json` to make required customizations.
- Follow comments in `docker-compose.yml` to make required customizations.
- Follow instructions on <https://code.visualstudio.com/docs/devcontainers/containers> to setup the container.
- Run the license setup inside the container.
