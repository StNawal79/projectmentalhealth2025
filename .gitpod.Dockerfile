FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt update && apt install -y \
  wget curl git clang cmake make build-essential \
  libgmp-dev libssl-dev libusb-1.0-0-dev zlib1g-dev \
  libcurl4-openssl-dev libboost-all-dev python3 python3-pip

# Install eosio.cdt dari release binary
RUN wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.8.1/eosio.cdt_1.8.1-1-ubuntu-20.04_amd64.deb && \
    apt install -y ./eosio.cdt_1.8.1-1-ubuntu-20.04_amd64.deb && \
    rm eosio.cdt_1.8.1-1-ubuntu-20.04_amd64.deb
