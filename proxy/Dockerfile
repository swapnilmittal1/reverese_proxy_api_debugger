########################################
# 1. ─── build stage ───────────────────
########################################
FROM --platform=$BUILDPLATFORM ubuntu:22.04 AS builder
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates curl git build-essential cmake pkg-config \
        libssl-dev libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# ── build Poco 1.14.2 ──────────────────────────────────────────────────────
ARG POCO_VER=1.14.2    # version you want
RUN git clone https://github.com/pocoproject/poco.git /tmp/poco-src && \
    cd /tmp/poco-src && \
    git checkout poco-${POCO_VER}-release || git checkout poco-${POCO_VER} && \
    mkdir cmake-build && cd cmake-build && \
    cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DENABLE_TESTS=OFF \
      -DENABLE_DATA_POSTGRESQL=ON \
      -DENABLE_DATA_MYSQL=OFF  \
      -DENABLE_DATA_ODBC=OFF && \
    cmake --build . -j"$(nproc)" && \
    cmake --install .            # installs into /usr/local

# ── build your proxy binary ────────────────────────────────────────────────
WORKDIR /src
COPY ../../proxy .
RUN cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build -j"$(nproc)"

##############################
# 2 · runtime stage
##############################
FROM --platform=$TARGETPLATFORM ubuntu:22.04
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libssl3 libpq5 tzdata ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# ── ① copy ALL Poco shared libraries
COPY --from=builder /usr/local/lib/libPoco*.so* /usr/local/lib/

# ── ② refresh the cache (or set LD_LIBRARY_PATH)
RUN ldconfig

WORKDIR /app
COPY --from=builder /src/build/proxy ./proxy

ENV PG_DSN="host=db port=5432 dbname=postgres user=postgres password=apidebugger"
EXPOSE 8080
ENTRYPOINT ["./proxy"]
