Podman Ubuntu Archive
==

Autoupdated archive of ubuntu builds for podman.

Installing
--

To use this PPA, use the steps below to trust the archive and use it to download podman builds:

```bash
curl -s 'https://notbobthebuilder.github.io/podman/jack+ppa.jackwearden.co.uk.gpg' | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/jack+ppa.jackwearden.co.uk.gpg > /dev/null
sudo curl -s -o /etc/apt/sources.list.d/notbobthebuilder_podman.list 'https://notbobthebuilder.github.io/podman/notbobthebuilder_podman.list'
sudo apt-get update
sudo apt-get install podman
```

Development
--

- `.github/workflows/release.yml` contains the fetch and build process. Multi arch builds are supported for aarch64 and amd64
