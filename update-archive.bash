#!/bin/bash


sudo apt-get -qq install -y gnupg dpkg-dev apt-utils
ls artifacts/*
find artifacts
cp artifacts/**/*.deb archive
cd archive
dpkg-scanpackages --multiversion . > Packages
gzip -fk Packages
apt-ftparchive release . > Release
echo "$GPG_PRIVATE_KEY" | gpg --armor --import
gpg --default-key "$EMAIL" -abs -o - Release > Release.gpg
gpg --default-key "$EMAIL" --clearsign -o - Release > InRelease
