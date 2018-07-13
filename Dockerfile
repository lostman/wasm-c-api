FROM ubuntu:bionic
RUN apt-get update && apt-get install -y \
    apt-utils \
    clang \
    cmake \
    curl \
    git \
    libc++-dev \
    libc++abi-dev \
    libglib2.0-dev \
    libgmp-dev \
    ninja-build \
    python
RUN git clone https://github.com/webassembly/wabt && \
    cd wabt && mkdir build && \
    cd build && \
    cmake .. -DBUILD_TESTS=OFF && \
    make && \
    cp wat2wasm /usr/local/bin
ENV WASM_INTERPRETER = /usr/local/bin/wat2wasm
