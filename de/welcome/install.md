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

## Hardware requirement {#hardware}

Mindestens 32 MB freier Speicher.

## Download {#download}

Vorgefertigte Pakete finden Sie hier:

1. Github Veröffentlichung: [github.com/v2ray/v2ray-core](https://github.com/v2ray/v2ray-core/releases)
2. Redistribution: [v2ray.com/download](https://www.v2ray.com/download/)
3. Homebrew: [github.com/v2ray/homebrew-v2ray](https://github.com/v2ray/homebrew-v2ray)
4. Arch Linux: [packages/community/x86_64/v2ray/](https://www.archlinux.org/packages/community/x86_64/v2ray/)
5. Snapcraft: [snapcraft.io/v2ray-core](https://snapcraft.io/v2ray-core)

All packages are in ZIP format. Download and unzip corresponding packages to your system.

## Überprüfen {#verify}

Es gibt 2 Möglichkeiten, Pakete zu überprüfen.

1. Metadata.txt in Release-Seite enthält SHA1-Hash für alle Pakete.
2. Die GPG-Signaturdatei für ausführbare Dateien (v2ray / v2ray.exe) befindet sich in v2ray.sig (oder v2ray.exe.sig) im selben Paket. Der öffentliche Schlüssel ist [im Repository](https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/verify/official_release.asc).

## Install on Windows or Mac OS {#install-windows}

Führen Sie v2ray / v2ray.exe aus, nachdem Sie die Pakete entpackt haben.

## Install on Linux {#install-linux}

Wir bieten ein Skript zur Installation unter Linux an. Dieses Skript erkennt zuvor installierte v2ray und aktualisiert oder installiert dann eine neue Version entsprechend. Wenn es eine vorherige Version gibt, wird die Konfigurationsdatei in / etc / v2ray während des Upgrades nicht überschrieben.

Der folgende Befehl nimmt root-Berechtigung an.

Führen Sie den folgenden Befehl aus, um V2Ray zu installieren. Wenn yum oder apt verfügbar ist, installiert das Skript unzip und daemon / systemd. Sie müssen V2Ray als Dienst ausführen. Sie müssen sie manuell installieren, wenn Ihr Linux-System yum oder apt nicht unterstützt.

```bash
bash <(curl -L -s https://install.direct/go.sh)
```

Das Skript installiert die folgenden Dateien.

* `/ usr / bin / v2ray / v2ray`: Ausführbare Datei von V2Ray
* `/ usr / bin / v2ray / v2ctl`: Dienstprogramm
* `/etc/v2ray/config.json`: Config-Datei
* `/usr/bin/v2ray/geoip.dat`: IP-Datendatei
* `/usr/bin/v2ray/geosite.dat`: Domain-Datendatei

Dieses Skript konfiguriert auch V2Ray als Dienst, wenn systemd verfügbar ist.

Konfigurationen sind an folgenden Stellen.

* `/etc/systemd/system/v2ray.service`: Systemd
* `/etc/init.d/v2ray`: SysV

Nach der Installation müssen wir:

1. Update `/etc/v2ray/config.json` Datei für Ihr eigenes Szenario.
2. Führen Sie `service v2ray start` , um V2Ray zu starten.
3. Starten Sie optional `service v2ray start | stop | status | reload | restart | force-reload` , um den V2Ray-Dienst zu steuern.

### go.sh {#gosh}

go.sh unterstützt die folgenden Parameter.

* `-p` or `--proxy`: Use a proxy to download V2Ray packages. Same as curl format, such as `"socks5://127.0.0.1:1080"` or `"http://127.0.0.1:3128"`.
* `-f` or `--force`: Force installation. The script will assume V2Ray was not installed at all.
* `--version`: The version to be installed, such as `"v1.13"`. Default value is the latest stable release.
* `--local`: Verwenden Sie ein lokales Paket für die Installation.

Beispiele:

* Verwenden Sie den SOCKS-Proxy 127.0.0.1:1080, um das neueste Paket zu installieren: ```./go.sh -p socks5: //127.0.0.1: 1080```
* Installiere v1.13 von der lokalen Datei:```./go.sh --version v1.13 --local /pfad/zu/v2ray.zip```

## Docker {#docker}

V2Ray bietet 2 Docker-Images:

* [v2ray/official](https://hub.docker.com/r/v2ray/official/): Contains official releases.
* [v2ray/dev](https://hub.docker.com/r/v2ray/dev/): Contains latest code.

Die 2 Bilder haben die gleiche Struktur wie die Linux-Installation.