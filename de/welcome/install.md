# Download & Installieren

![Englisch](../resources/englishc.svg) [![Chinesisch](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/install.html)

## Plattform

V2Ray ist auf den folgenden Plattformen verfügbar:

* Windows Vista und höher (x86 / amd64)
* Mac OS X 10.7 und höher (amd64)
* Linux 2.6.23 und höher (x86 / amd64 / arm / arm64 / mips64 / mips) 
  * Einschließlich, aber nicht beschränkt auf Debian 7/8, Ubuntu 12.04 / 14.04 und später, CentOS 6/7, Arch Linux
* FreeBSD (x86 / amd64)
* OpenBSD (x86 / amd64)
* Libelle BSD (amd64)

## Hardwareanforderung

Mindestens 32 MB freier Speicher.

## Herunterladen

Vorgefertigte Pakete finden Sie hier:

1. Github Veröffentlichung: [github.com/v2ray/v2ray-core](https://github.com/v2ray/v2ray-core/releases)
2. IPFS: [/ ipns / QmdtMuAhEUPFX9NQiGhRj2zhS1oEA76SXNDnZRHqivjMwR](https://ipfs.io/ipns/QmdtMuAhEUPFX9NQiGhRj2zhS1oEA76SXNDnZRHqivjMwR)
3. IPFS Re-dist: <https://v2ray.com/download>

Alle Pakete sind im ZIP-Format. Laden Sie entsprechende Pakete herunter und entzippen Sie sie auf Ihrem System.

## Überprüfen

Es gibt 2 Möglichkeiten, Pakete zu überprüfen.

1. Metadata.txt in Release-Seite enthält SHA1-Hash für alle Pakete.
2. Die GPG-Signaturdatei für ausführbare Dateien (v2ray / v2ray.exe) befindet sich in v2ray.sig (oder v2ray.exe.sig) im selben Paket. Der öffentliche Schlüssel ist [im Repository](https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/verify/official_release.asc).

## Installieren Sie unter Windows oder Mac OS

Führen Sie v2ray / v2ray.exe aus, nachdem Sie die Pakete entpackt haben.

## Installieren Sie unter Linux

Wir bieten ein Skript zur Installation unter Linux an. Dieses Skript erkennt zuvor installierte v2ray und aktualisiert oder installiert dann eine neue Version entsprechend. Wenn es eine vorherige Version gibt, wird die Konfigurationsdatei in / etc / v2ray während des Upgrades nicht überschrieben.

Der folgende Befehl nimmt root-Berechtigung an.

Führen Sie den folgenden Befehl aus, um V2Ray zu installieren. Wenn yum oder apt verfügbar ist, installiert das Skript unzip und daemon / systemd. Sie müssen V2Ray als Dienst ausführen. Sie müssen sie manuell installieren, wenn Ihr Linux-System yum oder apt nicht unterstützt.

```shell
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

### Meine Güte

go.sh unterstützt die folgenden Parameter.

* `-p` oder `--proxy`: Verwenden Sie einen Proxy, um V2Ray-Pakete herunterzuladen. Das gleiche wie das Curl-Format, zB `"socks5: //127.0.0.1: 1080"` oder `"http://127.0.0.1:3128"`.
* `-f` oder `Kraft`: Erzwingen der Installation. Das Skript wird davon ausgehen, dass V2Ray überhaupt nicht installiert wurde.
* `Version`: Die zu installierende Version, zB `"v1.13"`. Der Standardwert ist die letzte stabile Version.
* `--local`: Verwenden Sie ein lokales Paket für die Installation.

Beispiele:

* Verwenden Sie den SOCKS-Proxy 127.0.0.1:1080, um das neueste Paket zu installieren: ```./go.sh -p socks5: //127.0.0.1: 1080```
* Installiere v1.13 von der lokalen Datei:```./go.sh --version v1.13 --local /pfad/zu/v2ray.zip```

## Docker

V2Ray bietet 2 Docker-Images:

* [v2ray / offiziell](https://hub.docker.com/r/v2ray/official/) [![official](https://images.microbadger.com/badges/image/v2ray/official.svg)](https://microbadger.com/images/v2ray/official): Enthält offizielle Versionen.
* [v2ray / dev](https://hub.docker.com/r/v2ray/dev/) [![dev](https://images.microbadger.com/badges/image/v2ray/dev.svg)](https://microbadger.com/images/v2ray/dev): Enthält den neuesten Code.

Die 2 Bilder haben die gleiche Struktur wie die Linux-Installation.