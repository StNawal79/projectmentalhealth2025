FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  curl wget git cmake clang build-essential \
  zlib1g-dev libgmp-dev libssl-dev libusb-1.0-0-dev \
  libcurl4-openssl-dev python3 python3-pip libbz2-dev

# Install eosio.cdt
RUN git clone --recursive https://github.com/EOSIO/eosio.cdt && \
    cd eosio.cdt && \
    ./build.sh && \
    cd build && \
    make install
