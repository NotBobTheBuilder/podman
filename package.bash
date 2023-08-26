#!/bin/bash

mkdir out
docker run --rm --user 0 -v $(pwd)/podman/deb:/src -v $(pwd)/out:/out \
  ghcr.io/notbobthebuilder/fpm \
  --input-type dir \
  --output-type deb \
  --package /out/ \
  --version $PACKAGE_VERSION \
  --architecture $ARCH \
  --name podman \
  --description 'engine to run OCI-based containers in Pods. Podman is an engine for running OCI-based containers in Pods. Podman provides a CLI interface for managing Pods, Containers, and Container Images.' \
  --maintainer jack@jackwearden.co.uk \
  --license 'Apache 2.0' \
  --url https://github.com/containers/podman \
  --depends 'conmon (>= 2.0.18~)' \
  --depends 'golang-github-containers-common' \
  --depends 'crun | runc (>= 1.0.0~rc92~)' \
  --depends 'init-system-helpers (>= 1.52)' \
  --depends 'libc6 (>= 2.34)' \
  --depends 'libdevmapper1.02.1 (>= 2:1.02.97)' \
  --depends 'libgpgme11 (>= 1.4.1)' \
  --depends 'libseccomp2 (>= 2.4.1)' \
  --depends 'conmon (>= 2.0.18~)' \
  --depends 'containernetworking-plugins (>= 0.8.7)' \
  --depends 'uidmap' \
  --deb-recommends 'buildah (>= 1.28)' \
  --deb-recommends 'dbus-user-session' \
  --deb-recommends 'fuse-overlayfs (>= 1.0.0~)' \
  --deb-recommends 'slirp4netns (>= 0.4.1~)' \
  --deb-recommends 'catatonit | tini | dumb-init' \
  --deb-recommends 'golang-github-containernetworking-plugin-dnsname' \
  --deb-suggests 'containers-storage' \
  --deb-suggests 'docker-compose' \
  --deb-suggests 'iptables' \
  --deb-field "X-Release-Branch: $PACKAGE_VERSION" \
  .
ls out/*
