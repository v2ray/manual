---
refcn: chapter_00/install
refen: welcome/install
---
# Загрузка и установка

## Платформа {#platform}

V2Ray доступен на следующих платформах:

* Windows 7 и более поздние версии (x86 / amd64)
* Mac OS X 10.10 Yosemite и более поздние версии (amd64)
* Linux 2.6.23 и более поздние версии (x86 / amd64 / arm / arm64 / mips64 / mips) 
  * Включая, но не ограничиваясь, Debian 7/8, Ubuntu 12.04 / 14.04 и более поздние версии, CentOS 6/7, Arch Linux
* FreeBSD (x86 / amd64)
* OpenBSD (x86 / amd64)
* Dragonfly BSD (amd64)

## Download {#download}

Pre-built packages can be found here:

1. Github Release: [github.com/v2ray/v2ray-core](https://github.com/v2ray/v2ray-core/releases)
2. Собранные утилиты: [v2ray.com/download](https://www.v2ray.com/download/)
3. Homebrew: [github.com/v2ray/homebrew-v2ray](https://github.com/v2ray/homebrew-v2ray)
4. Arch Linux: [packages/community/x86_64/v2ray/](https://www.archlinux.org/packages/community/x86_64/v2ray/)
5. Snapcraft: [snapcraft.io/v2ray-core](https://snapcraft.io/v2ray-core)

All packages are in ZIP format. Download and unzip corresponding packages to your system.

## Verify {#verify}

There are 2 ways to verify packages.

1. Each `.zip` file has a corresponding `.dgst` file for SHA digests.
2. Файл подписи GPG для исполняемых файлов (v2ray / v2ray.exe) можно найти в файле v2ray.sig (или v2ray.exe.sig) в том же пакете. Открытый ключ находится [в хранилище](https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/verify/official_release.asc).

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

* `/usr/bin/v2ray/v2ray`: Исполняемый файл V2Ray
* `/usr/bin/v2ray/v2ctl`: Утилита управления
* `/etc/v2ray/config.json`: Файл с настройками
* `/usr/bin/v2ray/geoip.dat`: Файл с данными об IP
* `/usr/bin/v2ray/geosite.dat`: Файл с данными о доменах

This script also configures V2Ray to run as service, if systemd is available.

Configurations are at the following places.

* `/etc/systemd/system/v2ray.service`: Systemd
* `/etc/init.d/v2ray`: SysV

After installation, we will need to:

1. Изменить файл `/etc/v2ray/config.json` так, как вам необходимо.
2. Выполнить команду `service v2ray start` для запуска V2Ray.
3. Опционально выполнить `service v2ray start|stop|status|reload|restart|force-reload` для управления службой V2Ray.

### go.sh {#gosh}

go.sh supports the following parameters.

* `-p` или `--proxy`: Использовать прокси для загрузки пакетов V2Ray. Формат такой же, как и у curl. Например, `"socks5://127.0.0.1:1080"` или `"http://127.0.0.1:3128"`.
* `-f` or `--force`: Принудительная установка. Сценарий предполагает, что V2Ray не был установлен вообще.
* `--version`: Версия, которая должна быть установлена, например `"v1.13"`. Значение по умолчанию - это последняя стабильная версия.
* `--local`: Использовать локальный пакет для установки.

Examples:

* Использовать SOCKS-прокси 127.0.0.1:1080 для установки последнего пакета: ```./go.sh -p socks5://127.0.0.1:1080```
* Установить v1.13 из локального файла:```./go.sh --version v1.13 --local /path/to/v2ray.zip```

## Docker {#docker}

V2Ray provides 2 docker images:

* [v2ray/official](https://hub.docker.com/r/v2ray/official/): Официальные релизы.
* [v2ray/dev](https://hub.docker.com/r/v2ray/dev/): Свежайший код (в разработке).

The 2 images has the same structure as the Linux installation.