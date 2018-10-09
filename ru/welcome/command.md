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

Где:

* `-version`: Вывести версию V2Ray, затем завершить работу.
* `-test`: Считать и проверить настройки, вывести найденные ошибки, затем завершить работу.
* `-config`: URI файла с настройками. 
  * When its value is `stdin:`, V2Ray reads configuration from standard input. Caller must close stdin after writing out configuration.
  * Если значение начинается с `http://` или `https://` (строчными), V2Ray пытается загрузить конфигурацию по указанному адресу.
  * Если значение не задано, V2Ray сначала пытается загрузить конфигурацию из `config.json` из рабочего каталога, а затем из каталога, заданного переменной среды `v2ray.location.asset`.
* `-format`: Configuration format. Choices are: 
  * `json`: формат JSON.
  * `pb` или `protobuf`: формат Protobuf.

## V2Ctl

V2Ctl имеет следующие параметры командной строки:

```shell
v2ctl <command> <options>
```

Available commands are listed below. Each command has its own options.

### Verify

`v2ctl verify [--sig=/path/to/sigfile] /file/to/verify`

Проверка подписи бинарного файла V2Ray.

Опциональные параметры:

* `sig`：Path to signature file. Default value is the ".sig" file to the path to be verified.
* Первый аргумент: файл для проверки.

### Config

`v2ctl config`

No options. This command reads configuration in JSON format from stdin, and then write corresponding configuration in Protobuf format to stdout.

### UUID

`v2ctl uuid`

No options. This command prints a random UUID.