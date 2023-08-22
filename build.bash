#!/bin/bash

apt-get -qq update
apt-get -qq install -y libsystemd-dev libseccomp-dev golang-github-proglottis-gpgme-dev make golang-go git python3 bash
git config --global --add safe.directory '*'
cd /podman
make binaries docs completions install install.completions PREFIX=./deb/usr ETCDIR=./deb/etc SHELL=/bin/bash
gzip -r deb/usr/share/man
