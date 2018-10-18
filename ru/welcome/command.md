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
* `-config`: URI of the configuration. Avilable formats are: 
  * Path to the local config file. May be a relative path or absolute path.
  * `"stdin:"`: Indicates V2Ray to read configuration from standard input. Caller must close stdin after writing out configuration.
  * Value begins with `http://` or `https://` (lowercase): V2Ray tries to load configuration from the remote address.
* `-format`: Configuration format. Choices are: 
  * `json`: формат JSON.
  * `pb` или `protobuf`: формат Protobuf.

{% hint style='info' %} When `-config` is not specified, V2Ray first tries to load configuration from `config.json` under working directory, then from the directory specified by [environment variable](../configuration/env.md) `v2ray.location.asset`. {% endhint %}

## V2Ctl

V2Ctl имеет следующие параметры командной строки:

```shell
v2ctl <command> <options>
```

Ниже перечислены доступные команды. Каждая команда имеет свои собственные параметры.

### Verify

`v2ctl verify [--sig=/path/to/sigfile] /file/to/verify`

Проверка подписи бинарного файла V2Ray.

Опциональные параметры:

* `sig`：Путь к файлу с подписью. Значение по умолчанию - ".sig"-файл в проверяемом пути.
* Первый аргумент: файл для проверки.

### Config

`v2ctl config`

Нет параметров. Эта команда считывает конфигурацию в формате JSON из потока stdin, а выводит её в формате Protobuf в stdout.

### UUID

`v2ctl uuid`

Нет параметров. Эта команда выводит случайный UUID.