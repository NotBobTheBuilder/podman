#!/bin/bash
set -e -o pipefail

apt-get update -qq
apt-get install -qq -y libsystemd-dev libseccomp-dev golang-github-proglottis-gpgme-dev make golang-go git python3 bash
git config --global --add safe.directory '*'
cd /podman
make binaries docs completions install install.completions DESTDIR=./deb PREFIX=/usr ETCDIR=/etc SHELL=/bin/bash
gzip -r ./deb/usr/share/man
