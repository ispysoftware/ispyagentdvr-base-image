#!/bin/bash

# Exit on error and print each command for debugging
set -ex

echo "*****     Installing VLC with all of its dependencies       *****"
case $(arch) in
'x86_64' | 'amd64')
    # amd64 has sid libc6/libglvnd0 from GPU driver install — VLC must also come from sid
    DEBIAN_FRONTEND=noninteractive apt-get install -t sid -y --no-install-recommends --no-install-suggests \
    libvlc-dev vlc libx11-dev
    ;;
*)
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends --no-install-suggests \
    libvlc-dev vlc libx11-dev
    ;;
esac
echo "****      Installation of VLC Completed       ****"