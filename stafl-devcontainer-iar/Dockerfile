ARG BXARM=non-fs

FROM ghcr.io/staflsystems/stafl-devcontainer-ci:0.4.1-0 AS stafl-devcontainer-iar-non-fs
COPY iar/bxarm-*.deb /tmp
ENV PATH="$PATH:/opt/iarsystems/bxarm/arm/bin"

FROM ghcr.io/staflsystems/stafl-devcontainer-ci:0.4.1-0 AS stafl-devcontainer-iar-fs
COPY iar/bxarmfs-*.deb /tmp
ENV PATH="$PATH:/opt/iarsystems/bxarmfs/arm/bin"

FROM stafl-devcontainer-iar-${BXARM}

COPY axivion/* /tmp
COPY user-setup-scripts/ /user-setup-scripts/

RUN  export DEBIAN_FRONTEND=noninteractive && \
     apt-get update && \
     apt-get install --no-install-recommends -y sudo libsqlite3-0 libxml2 tzdata && \
     apt-get install --no-install-recommends -y /tmp/bx*.deb && \
     apt-get clean autoclean autoremove && \
     rm -rf /tmp/*.deb

RUN wget https://github.com/gabime/spdlog/archive/refs/tags/v1.12.0.tar.gz \
    && tar zxvf v1.12.0.tar.gz \
    && cd spdlog-1.12.0 \
    && mkdir build \
    && cmake -S . -B build \
    && cmake --build build --target install -j $(nproc) \
    && cd .. && rm -rf spdlog-1.12.0 v1.12.0.tar.gz

RUN if [ -n "$(find /tmp -maxdepth 1 -name 'bauhaus*.tar.gz' -print -quit)" ]; then \
     echo "Installing Axivion Bauhaus Suite..." && \
     cd /opt && \
     tar -xvf /tmp/bauhaus*.tar.gz && \
     cp /tmp/*.key bauhaus-suite/config/ && \
     rm -rf /var/lib/apt/lists/* /tmp/*.deb /tmp/bauhaus*.tar.gz && \
     echo ". /user-setup-scripts/axivion/install-vscode-plugin.sh" >> /user-setup-scripts/setup-all.sh; \
    else \
     echo "No bauhaus*.tar.gz found in /tmp - skipping Axivion installation"; \
    fi

WORKDIR ${HOME}