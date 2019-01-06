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
* Value begins with `http://` or `https://` (lowercase): V2Ray tries to load configuration from the remote address.

> `-format`

Configuration format. Choices are:

* `json`: JSON format.
* `pb` or `protobuf`: Protobuf format.

{% hint style='info' %}

When `-config` is not specified, V2Ray first tries to load configuration from `config.json` under working directory, then from the directory specified by [environment variable](../configuration/env.md) `v2ray.location.asset`.

{% endhint %}

## V2Ctl

V2Ctl has the following commandline parameters:

```shell
v2ctl <command> <options>
```

Available commands are listed below. Each command has its own options.

### Verify

`v2ctl verify [--sig=/path/to/sigfile] /file/to/verify`

To verify the signature of a V2Ray binary.

Options:

> `sig`

Path to signature file. Default value is the ".sig" file to the path to be verified.

> First argument: the file to be verified.

### Config

`v2ctl config`

No options. This command reads configuration in JSON format from stdin, and then write corresponding configuration in Protobuf format to stdout.

### UUID

`v2ctl uuid`

No options. This command prints a random UUID.