FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies dasar
RUN apt update && apt install -y \
    curl wget git cmake clang build-essential \
    zlib1g-dev libgmp-dev libssl-dev libusb-1.0-0-dev \
    libcurl4-openssl-dev python3 python3-pip libbz2-dev

# ✅ Install EOSIO.CDT 1.8.1
RUN wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.8.1/eosio.cdt_1.8.1-1-ubuntu-20.04_amd64.deb && \
    apt install -y ./eosio.cdt_1.8.1-1-ubuntu-20.04_amd64.deb && \
    rm eosio.cdt_1.8.1-1-ubuntu-20.04_amd64.deb

# ✅ Install EOSIO 2.0.13 via source (lebih stabil)
RUN git clone https://github.com/EOSIO/eos.git --recursive && \
    cd eos && \
    git checkout v2.0.13 && \
    ./scripts/eosio_build.sh && \
    ./scripts/eosio_install.sh && \
    cd .. && rm -rf eos

