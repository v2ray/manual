# Загрузка и установка

[![English](../resources/english.svg)](https://www.v2ray.com/en/welcome/install.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/install.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/welcome/install.html) [![Перевод](../resources/lang.svg)](https://crowdin.com/project/v2ray)

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
2. Redistribution: <https://v2ray.com/download>

Все пакеты находятся в формате ZIP. Загрузите и распакуйте подходящие пакеты в свою систему.

## Проверка {#verify}

Существует два способа проверки пакетов.

1. Metadata.txt на странице релиза содержит хэш SHA1 для всех пакетов.
2. Файл подписи GPG для исполняемых файлов (v2ray / v2ray.exe) можно найти в файле v2ray.sig (или v2ray.exe.sig) в том же пакете. Открытый ключ находится [в хранилище](https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/verify/official_release.asc).

## Установка в Windows и Mac OS {#install-windows}

Запустите v2ray / v2ray.exe после распаковки пакетов.

## Установка в Linux {#install-linux}

Мы предоставляем сценарий для установки в Linux. Этот сценарий обнаруживает предыдущую инсталляцию v2ray и затем обновляет старую или устанавливает новую. Если предыдущая версия обнаруживается, конфигурационный файл в /etc/v2ray не будет перезаписан во время обновления.

Следующая команда требует прав суперпользователя.

Выполните следующую команду для установки V2Ray. Если yum или apt доступны, скрипт установит unzip и daemon / systemd. Они необходимы для запуска V2Ray в качестве службы. Вам необходимо установить их вручную, если ваша система Linux не поддерживает yum или apt.

```shell
bash <(curl -L -s https://install.direct/go.sh)
```

Этот сценарий устанавливает следующие файлы.

* `/usr/bin/v2ray/v2ray`: Исполняемый файл V2Ray
* `/usr/bin/v2ray/v2ctl`: Utility
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

* `-p` или `--proxy`: Использовать прокси для загрузки пакетов V2Ray. Формат такой же, как и у curl. Например, `"socks5://127.0.0.1:1080"` или `"http://127.0.0.1:3128"`.
* `-f` or `--force`: Принудительная установка. Сценарий предполагает, что V2Ray не был установлен вообще.
* `--version`: Версия, которая должна быть установлена, например `"v1.13"`. Значение по умолчанию - это последняя стабильная версия.
* `--local`: Использовать локальный пакет для установки.

Примеры:

* Использовать SOCKS-прокси 127.0.0.1:1080 для установки последнего пакета: ```./go.sh -p socks5://127.0.0.1:1080```
* Установить v1.13 из локального файла:```./go.sh --version v1.13 --local /path/to/v2ray.zip```

## Docker {#docker}

V2Ray предоставляет два типа докер-контейнеров:

* [v2ray/official](https://hub.docker.com/r/v2ray/official/) [![official](https://images.microbadger.com/badges/image/v2ray/official.svg)](https://microbadger.com/images/v2ray/official): Содержит официальные релизы.
* [v2ray/dev](https://hub.docker.com/r/v2ray/dev/) [![dev](https://images.microbadger.com/badges/image/v2ray/dev.svg)](https://microbadger.com/images/v2ray/dev): Содержит свежайший код.

Контейнеры имеют ту же структуру, что и установленный Linux.