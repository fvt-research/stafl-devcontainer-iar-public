ARG BXARM=non-fs

FROM ghcr.io/staflsystems/stafl-devcontainer-ci:0.3.2-0 AS stafl-devcontainer-iar-non-fs
COPY iar/bxarm-*.deb /tmp
ENV PATH "$PATH:/opt/iarsystems/bxarm/arm/bin"

FROM ghcr.io/staflsystems/stafl-devcontainer-ci:0.3.2-0 AS stafl-devcontainer-iar-fs
COPY iar/bxarmfs-*.deb /tmp
ENV PATH "$PATH:/opt/iarsystems/bxarmfs/arm/bin"

FROM stafl-devcontainer-iar-${BXARM}

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

WORKDIR ${HOME}