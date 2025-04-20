FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# ✅ Tambahkan semua dependensi lengkap
RUN apt update && apt install -y \
    wget curl git cmake clang build-essential \
    libgmp-dev libssl-dev libusb-1.0-0-dev \
    libcurl4-openssl-dev zlib1g-dev libicu-dev \
    libboost-all-dev software-properties-common \
    python3 python3-pip libbz2-dev

# ✅ Install EOSIO (nodeos, cleos)
RUN wget https://github.com/EOSIO/eos/releases/download/v2.0.13/eosio_2.0.13-1-ubuntu-20.04_amd64.deb && \
    apt install -y ./eosio_2.0.13-1-ubuntu-20.04_amd64.deb && \
    rm eosio_2.0.13-1-ubuntu-20.04_amd64.deb

# ✅ Install EOSIO.CDT (eosio-cpp)
RUN wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.8.1/eosio.cdt_1.8.1-1-ubuntu-20.04_amd64.deb && \
    apt install -y ./eosio.cdt_1.8.1-1-ubuntu-20.04_amd64.deb && \
    rm eosio.cdt_1.8.1-1-ubuntu-20.04_amd64.deb

