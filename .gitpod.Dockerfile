FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt update && apt install -y \
    wget curl git cmake clang build-essential \
    libgmp-dev libssl-dev libusb-1.0-0-dev \
    libcurl4-openssl-dev zlib1g-dev libicu-dev \
    libboost-all-dev software-properties-common \
    python3 python3-pip libbz2-dev

# Install EOSIO.CDT (Compiler eosio-cpp)
RUN git clone --recursive https://github.com/EOSIO/eosio.cdt && \
    cd eosio.cdt && ./build.sh && cd build && make install

# Install EOSIO (nodeos, cleos) via .deb
RUN wget https://github.com/EOSIO/eos/releases/download/v2.0.13/eosio_2.0.13-1-ubuntu-20.04_amd64.deb && \
    apt install -y ./eosio_2.0.13-1-ubuntu-20.04_amd64.deb || apt --fix-broken install -y && \
    rm eosio_2.0.13-1-ubuntu-20.04_amd64.deb

