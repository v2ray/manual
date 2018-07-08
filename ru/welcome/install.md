# Загрузка и установка

[![English](../resources/english.svg)](https://www.v2ray.com/en/welcome/install.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/install.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/welcome/install.html) [![Translate](../resources/lang.svg)](https://crowdin.com/project/v2ray)

## Платформа {#platform}

V2Ray доступен на следующих платформах:

* Windows Vista и более поздние версии (x86 / amd64)
* Mac OS X 10.7 и более поздние версии (amd64)
* Linux 2.6.23 и более поздние версии (x86 / amd64 / arm / arm64 / mips64 / mips) 
  * Включая, но не ограничиваясь, Debian 7/8, Ubuntu 12.04 / 14.04 и более поздние версии, CentOS 6/7, Arch Linux
* FreeBSD (x86 / amd64)
* OpenBSD (x86 / amd64)
* Dragonfly BSD (amd64)

## Требования к оборудованию {#hardware}

Не менее 32 МБ свободной памяти.

## Загрузка {#download}

Готовые пакеты можно найти здесь:

1. Github Release: [github.com/v2ray/v2ray-core](https://github.com/v2ray/v2ray-core/releases)
2. IPFS: [/ipns/QmdtMuAhEUPFX9NQiGhRj2zhS1oEA76SXNDnZRHqivjMwR](https://ipfs.io/ipns/QmdtMuAhEUPFX9NQiGhRj2zhS1oEA76SXNDnZRHqivjMwR)
3. IPFS Re-dist: <https://v2ray.com/download>

Все пакеты находятся в формате ZIP. Загрузите и распакуйте подходящие пакеты в свою систему.

## Проверка {#verify}

Существует два способа проверки пакетов.

1. Metadata.txt на странице релиза содержит хэш SHA1 для всех пакетов.
2. Файл подписи GPG для исполняемых файлов (v2ray / v2ray.exe) можно найти в файле v2ray.sig (или v2ray.exe.sig) в том же пакете. Открытый ключ находится [в хранилище](https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/verify/official_release.asc).

## Установка в Windows и Mac OS {#install-windows}

Запустите v2ray / v2ray.exe после распаковки пакетов.

## Установка в Linux {#install-linux}

Мы предоставляем сценарий для установки в Linux. Этот сценарий обнаруживает предыдущую инсталляцию v2ray и затем обновляет старую или устанавливает новую. Если предыдущая версия обнаруживается, конфигурационный файл в /etc/v2ray не будет перезаписан во время обновления.

The following command assumes root permission.

Выполните следующую команду для установки V2Ray. Если yum или apt доступны, скрипт установит unzip и daemon / systemd. Они необходимы для запуска V2Ray в качестве службы. Вам необходимо установить их вручную, если ваша система Linux не поддерживает yum или apt.

```shell
bash <(curl -L -s https://install.direct/go.sh)
```

Этот сценарий устанавливает следующие файлы.

* `/usr/bin/v2ray/v2ray`: V2Ray executable
* `/usr/bin/v2ray/v2ctl`: Utility
* `/etc/v2ray/config.json`: Config file
* `/usr/bin/v2ray/geoip.dat`: IP data file
* `/usr/bin/v2ray/geosite.dat`: domain data file

This script also configures V2Ray to run as service, if systemd is available.

Configurations are at the following places.

* `/etc/systemd/system/v2ray.service`: Systemd
* `/etc/init.d/v2ray`: SysV

After installation, we will need to:

1. Update `/etc/v2ray/config.json` file for your own scenario.
2. Run `service v2ray start` command to start V2Ray.
3. Optionally run `service v2ray start|stop|status|reload|restart|force-reload` to control V2Ray service.

### go.sh {#gosh}

go.sh supports the following parameters.

* `-p` or `--proxy`: Use a proxy to download V2Ray packages. Same as curl format, such as `"socks5://127.0.0.1:1080"` or `"http://127.0.0.1:3128"`.
* `-f` or `--force`: Force installation. The script will assume V2Ray was not installed at all.
* `--version`: The version to be installed, such as `"v1.13"`. Default value is the latest stable release.
* `--local`: Use a local package for installation.

Examples:

* Use SOCKS proxy 127.0.0.1:1080 to install the latest package: ```./go.sh -p socks5://127.0.0.1:1080```
* Install v1.13 from local file:```./go.sh --version v1.13 --local /path/to/v2ray.zip```

## Docker {#docker}

V2Ray provides 2 docker images:

* [v2ray/official](https://hub.docker.com/r/v2ray/official/) [![official](https://images.microbadger.com/badges/image/v2ray/official.svg)](https://microbadger.com/images/v2ray/official): Contains official releases.
* [v2ray/dev](https://hub.docker.com/r/v2ray/dev/) [![dev](https://images.microbadger.com/badges/image/v2ray/dev.svg)](https://microbadger.com/images/v2ray/dev): Contains latest code.

The 2 images has the same structure as the Linux installation.