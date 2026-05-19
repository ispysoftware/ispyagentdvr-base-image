#!/bin/bash

# Exit on error and print each command for debugging
set -ex

echo "**** Installing Dependencies ****"

LIBICU=$(apt-cache search '^libicu[0-9]+$' | awk '{print $1}' | sort -V | tail -1)
echo "**** Resolved ICU runtime package: ${LIBICU} ****"

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends --no-install-suggests \
    sudo \
    gosu \
    "${LIBICU}" \
    ncurses-bin \
    alsa-utils \
    curl \
    rsync \
    unzip \
    wget \
    openssl \
    gnupg \
    ca-certificates \
    locales \
    tzdata \
    libgdiplus \
    adduser