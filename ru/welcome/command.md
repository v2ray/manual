---
refcn: chapter_00/command
refen: welcome/command
---

# Командная строка

## V2Ray

V2Ray имеет следующие параметры командной строки:

```shell
v2ray [-version] [-test] [-config=config.json] [-format=json]
```

> `-version`

Вывести версию V2Ray, затем завершить работу.

> `-test`

Считать и проверить настройки, вывести найденные ошибки, затем завершить работу.

> `-config`

URI файла с настройками. Возможные варианты:

* Путь к локальному файлу с настройками. Может быть как относительным, так и абсолютным.
* `"stdin:"`: Указывает V2Ray считать настройки через стандартный поток ввода. Вызывающая программа должна закрыть stdin после вывода настроек.
* Начинающиеся с `http://` или `https://` (в нижнем регистре): V2Ray пытается загрузить настройки с указанного адреса.

> `-format`

Формат файла с настройками. Возможные варианты:

* `json`: формат JSON.
* `pb` или `protobuf`: формат Protobuf.

{% hint style='info' %}

Если значение `-config` не задано, V2Ray сначала пытается загрузить конфигурацию из `config.json` из рабочего каталога, а затем из каталога, заданного [переменной среды](../configuration/env.md) `v2ray.location.asset`.

{% endhint %}

## V2Ctl

V2Ctl — это набор инструментов командной строки. Он работает следующим образом:

```bash
v2ctl <command> <options>
```

> `command`

Доступные значения:

* `api`: Удалённое управление работающим V2Ray.
* `config`: Преобразовать конфигурацию из формата JSON в protobuf.
* `cert`: Генерировать сертификаты TLS.
* `fetch`: Загрузка удалённого конента.
* `tlsping`: (V2Ray 4.17+) Проверить усановление соединения (handshake) TLS.
* `verify`: Проверить подпись релиза V2Ray.
* `uuid`: Генерировать UUID.

### V2Ctl Api

`v2ctl api [--server=127.0.0.1:8080] <Service.Method> <Request>`

Удалённое управление запущеными серверами V2Ray. Пример:

`v2ctl api --server=127.0.0.1:8080 LoggerService.RestartLogger ''`

### V2Ctl Config

`v2ctl config`

Команда без параметров. Принимает конфигурацию в JSON из stdin, преобразует её в Protobuf и выводит в stdout.

### V2Ctl Cert

`v2ctl cert [--ca] [--domain=v2ray.com] [--expire=240h] [--name="V2Ray Inc"] [--org="V2Ray Inc] [--json] [--file=v2ray]`

Генерирует сертификат TLS на основе параметров.

> `--ca`

Если указано, сертификат будет сертификатом CA.

> `--domain`

Alternative Names in the certificate. This option can be used multiple times for multiple domains. For example: `--domain=v2ray.com --domain=v2ray.cool`.

> `--expire`

Expire date of the certificate. Value is a [Golang duration](https://golang.org/pkg/time/#ParseDuration).

> `--name`

Command Name in the certificate.

> `--org`

Orgnization in the certificate.

> `--json`

If specified, the certificate will be printed to stdout in the JSON format that is used in V2Ray.

> `--file`

Prints the certificate into files. When `--file=a`, two files named `a_cert.pem` and `a_key.pem` will be generated.

### V2Ctl Fetch

`v2ctl fetch <url>`

Fetch remove resources and print to stdout. Only HTTP and HTTPS URL are supported.

### V2Ctl TlsPing

`v2ctl tlsping <domain> --ip=[ip]`

Test TLS handlshake with specific domain.

> domain

Target domain for the TLS handshake.

> --ip

The IP address of the domain. If not specifed, V2Ctl resolves it through system DNS.

### V2Ctl Verify

`v2ctl verify [--sig=/path/to/sigfile] <filepath>`

To verify the signature of a V2Ray binary.

> `--sig`

Path to signature file. Default value is the ".sig" file to the path to be verified.

> `filepath`

The file to be verified.

### V2Ctl UUID

`v2ctl uuid`

No options. This command prints a random UUID.