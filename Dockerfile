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
RUN apt-get install -y ocaml ocamlbuild
RUN git clone https://github.com/webassembly/spec && \
    cd spec/interpreter && make && cp wasm /usr/local/bin/
