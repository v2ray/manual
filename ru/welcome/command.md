# Командная строка

[![English](../resources/english.svg)](https://www.v2ray.com/en/welcome/command.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/command.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/welcome/command.html) [![Translate](../resources/lang.svg)](https://crowdin.com/project/v2ray)

## V2Ray

V2Ray имеет следующие параметры командной строки:

```shell
v2ray [-version] [-test] [-config=config.json] [-format=json]
```

Где:

* `-version`: Вывести версию V2Ray, затем завершить работу.
* `-test`: Считать и проверить настройки, вывести найденные ошибки, затем завершить работу.
* `-config`: URI конфигурации. 
  * When its value is `stdin:`, V2Ray reads configuration from standard input. Caller must close stdin after writing out configuration.
  * When its value begins with `http://` or `https://` (lowercase), V2Ray tries to load configuration from the remote address.
  * When not set, V2Ray first tries to load configuration from `config.json` under working directory, then from the directory specified by environment variable `v2ray.location.asset`.
* `-format`: Configuration format. Возможные варианты: 
  * `json`: формат JSON.
  * `pb` or `protobuf`: Protobuf format.

## V2Ctl

V2Ctl has the following commandline parameters:

```shell
v2ctl <command> <options>
```

Available commands are listed below. Each command has its own options.

### Verify

`v2ctl verify [--sig=/path/to/sigfile] /file/to/verify`

To verify the signature of a V2Ray binary.

Опциональные параметры:

* `sig`：Path to signature file. Default value is the ".sig" file to the path to be verified.
* First argument: the file to be verified.

### Config

`v2ctl config`

No options. This command reads configuration in JSON format from stdin, and then write corresponding configuration in Protobuf format to stdout.

### UUID

`v2ctl uuid`

Нет параметров. This command prints a random UUID.