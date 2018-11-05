---
refcn: chapter_00/install
refen: welcome/install
---
# Download & Installieren

## Platform {#platform}

V2Ray ist auf den folgenden Plattformen verfügbar:

* Windows 7 and later (x86 / amd64)
* Mac OS X 10.10 Yosemite and later (amd64)
* Linux 2.6.23 und höher (x86 / amd64 / arm / arm64 / mips64 / mips) 
  * Einschließlich, aber nicht beschränkt auf Debian 7/8, Ubuntu 12.04 / 14.04 und später, CentOS 6/7, Arch Linux
* FreeBSD (x86 / amd64)
* OpenBSD (x86 / amd64)
* Libelle BSD (amd64)

## Download {#download}

Pre-built packages can be found here:

1. Github Veröffentlichung: [github.com/v2ray/v2ray-core](https://github.com/v2ray/v2ray-core/releases)
2. Redistribution: [v2ray.com/download](https://www.v2ray.com/download/)
3. Homebrew: [github.com/v2ray/homebrew-v2ray](https://github.com/v2ray/homebrew-v2ray)
4. Arch Linux: [packages/community/x86_64/v2ray/](https://www.archlinux.org/packages/community/x86_64/v2ray/)
5. Snapcraft: [snapcraft.io/v2ray-core](https://snapcraft.io/v2ray-core)

All packages are in ZIP format. Download and unzip corresponding packages to your system.

## Verify {#verify}

There are 2 ways to verify packages.

1. Each `.zip` file has a corresponding `.dgst` file for SHA digests.
2. Die GPG-Signaturdatei für ausführbare Dateien (v2ray / v2ray.exe) befindet sich in v2ray.sig (oder v2ray.exe.sig) im selben Paket. Der öffentliche Schlüssel ist [im Repository](https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/verify/official_release.asc).

## Install on Windows or Mac OS {#install-windows}

Run v2ray / v2ray.exe after unzip the packages.

## Install on Linux {#install-linux}

We provide a script to install on Linux. This script detects previous installed v2ray and then upgrade or install a new one accordingly. If there is a previous version, the config file in /etc/v2ray will not be overwritten during upgrade.

The following command assumes root permission.

Run the following command to install V2Ray. If yum or apt is available, the script will install unzip and daemon / systemd. They are required to run V2Ray as a service. You need to install them manually if your Linux system doesn't support yum or apt.

```bash
bash <(curl -L -s https://install.direct/go.sh)
```

The script installs the following files.

* `/ usr / bin / v2ray / v2ray`: Ausführbare Datei von V2Ray
* `/ usr / bin / v2ray / v2ctl`: Dienstprogramm
* `/etc/v2ray/config.json`: Config-Datei
* `/usr/bin/v2ray/geoip.dat`: IP-Datendatei
* `/usr/bin/v2ray/geosite.dat`: Domain-Datendatei

This script also configures V2Ray to run as service, if systemd is available.

Configurations are at the following places.

* `/etc/systemd/system/v2ray.service`: Systemd
* `/etc/init.d/v2ray`: SysV

After installation, we will need to:

1. Update `/etc/v2ray/config.json` Datei für Ihr eigenes Szenario.
2. Führen Sie `service v2ray start` , um V2Ray zu starten.
3. Starten Sie optional `service v2ray start | stop | status | reload | restart | force-reload` , um den V2Ray-Dienst zu steuern.

### go.sh {#gosh}

go.sh supports the following parameters.

* `-p` or `--proxy`: Use a proxy to download V2Ray packages. Same as curl format, such as `"socks5://127.0.0.1:1080"` or `"http://127.0.0.1:3128"`.
* `-f` or `--force`: Force installation. The script will assume V2Ray was not installed at all.
* `--version`: The version to be installed, such as `"v1.13"`. Default value is the latest stable release.
* `--local`: Verwenden Sie ein lokales Paket für die Installation.

Examples:

* Verwenden Sie den SOCKS-Proxy 127.0.0.1:1080, um das neueste Paket zu installieren: ```./go.sh -p socks5: //127.0.0.1: 1080```
* Installiere v1.13 von der lokalen Datei:```./go.sh --version v1.13 --local /pfad/zu/v2ray.zip```

## Docker {#docker}

V2Ray provides 2 docker images:

* [v2ray/official](https://hub.docker.com/r/v2ray/official/): Contains official releases.
* [v2ray/dev](https://hub.docker.com/r/v2ray/dev/): Contains latest code.

The 2 images has the same structure as the Linux installation.