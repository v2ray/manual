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

## Требования к оборудованию {#hardware}

Не менее 32 МБ свободной памяти.

## Загрузка {#download}

Готовые пакеты можно найти здесь:

1. Github Release: [github.com/v2ray/v2ray-core](https://github.com/v2ray/v2ray-core/releases)
2. Собранные утилиты: [v2ray.com/download](https://www.v2ray.com/download/)
3. Homebrew: [github.com/v2ray/homebrew-v2ray](https://github.com/v2ray/homebrew-v2ray)
4. Arch Linux: [packages/community/x86_64/v2ray/](https://www.archlinux.org/packages/community/x86_64/v2ray/)
5. Snapcraft: [snapcraft.io/v2ray-core](https://snapcraft.io/v2ray-core)

All packages are in ZIP format. Download and unzip corresponding packages to your system.

## Verify {#verify}

Существует два способа проверки пакетов.

1. Metadata.txt на странице релиза содержит хэш SHA1 для всех пакетов.
2. Файл подписи GPG для исполняемых файлов (v2ray / v2ray.exe) можно найти в файле v2ray.sig (или v2ray.exe.sig) в том же пакете. Открытый ключ находится [в хранилище](https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/verify/official_release.asc).

## Установка в Windows и Mac OS {#install-windows}

Запустите v2ray / v2ray.exe после распаковки пакетов.

## Установка в Linux {#install-linux}

Мы предоставляем сценарий для установки в Linux. Этот сценарий обнаруживает предыдущую инсталляцию v2ray и затем обновляет старую или устанавливает новую. Если предыдущая версия обнаруживается, конфигурационный файл в /etc/v2ray не будет перезаписан во время обновления.

Следующая команда требует прав суперпользователя.

Выполните следующую команду для установки V2Ray. Если yum или apt доступны, скрипт установит unzip и daemon / systemd. Они необходимы для запуска V2Ray в качестве службы. Вам необходимо установить их вручную, если ваша система Linux не поддерживает yum или apt.

```bash
bash <(curl -L -s https://install.direct/go.sh)
```

Этот сценарий устанавливает следующие файлы.

* `/usr/bin/v2ray/v2ray`: Исполняемый файл V2Ray
* `/usr/bin/v2ray/v2ctl`: Утилита управления
* `/etc/v2ray/config.json`: Файл с настройками
* `/usr/bin/v2ray/geoip.dat`: Файл с данными об IP
* `/usr/bin/v2ray/geosite.dat`: Файл с данными о доменах

Этот сценарий также настраивает V2Ray для запуска в качестве службы, если systemd доступен.

Конфигурации находятся в следующих местах.

* `/etc/systemd/system/v2ray.service`: Systemd
* `/etc/init.d/v2ray`: SysV

После установки необходимо:

1. Изменить файл `/etc/v2ray/config.json` так, как вам необходимо.
2. Выполнить команду `service v2ray start` для запуска V2Ray.
3. Опционально выполнить `service v2ray start|stop|status|reload|restart|force-reload` для управления службой V2Ray.

### go.sh {#gosh}

go.sh поддерживает следующие параметры.

* `-p` or `--proxy`: Use a proxy to download V2Ray packages. Same as curl format, such as `"socks5://127.0.0.1:1080"` or `"http://127.0.0.1:3128"`.
* `-f` or `--force`: Force installation. The script will assume V2Ray was not installed at all.
* `--version`: The version to be installed, such as `"v1.13"`. Default value is the latest stable release.
* `--local`: Использовать локальный пакет для установки.

Примеры:

* Использовать SOCKS-прокси 127.0.0.1:1080 для установки последнего пакета: ```./go.sh -p socks5://127.0.0.1:1080```
* Установить v1.13 из локального файла:```./go.sh --version v1.13 --local /path/to/v2ray.zip```

## Docker {#docker}

V2Ray предоставляет два типа докер-контейнеров:

* [v2ray/official](https://hub.docker.com/r/v2ray/official/): Официальные релизы.
* [v2ray/dev](https://hub.docker.com/r/v2ray/dev/): Свежайший код (в разработке).

Контейнеры имеют ту же структуру, что и установленный Linux.