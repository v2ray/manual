# Командная строка

[![Английский](../resources/english.svg)](https://www.v2ray.com/en/welcome/command.html) [![Китайский](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/command.html) [![Немецкий](../resources/german.svg)](https://www.v2ray.com/de/welcome/command.html) [![Русский](../resources/russian.svg)](https://www.v2ray.com/ru/welcome/command.html)

## V2Ray

V2Ray имеет следующие параметры командной строки:

```shell
v2ray [-version] [-test] [-config=config.json] [-format=json]
```

Где:

* `-version`: Вывести версию V2Ray, затем завершить работу.
* `-test`: Считать и проверить настройки, вывести найденные ошибки, затем завершить работу.
* `-config`: URI файла с настройками. 
  * Если значение равно `stdin:`, V2Ray считывает конфигурацию из стандартного ввода. Вызывающая программа должна закрыть stdin после записи конфигурации.
  * Если значение начинается с `http://` или `https://` (строчными), V2Ray пытается загрузить конфигурацию по указанному адресу.
  * Если значение не задано, V2Ray сначала пытается загрузить конфигурацию из `config.json` из рабочего каталога, а затем из каталога, заданного переменной среды `v2ray.location.asset`.
* `-format`: Формат файла с настройками. Возможные варианты: 
  * `json`: формат JSON.
  * `pb` или `protobuf`: формат Protobuf.

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

* `sig`：Путь к файлу с подписью. Значение по умолчанию - ".sig"-файл в проверяемом пути.
* Первый аргумент: файл для проверки.

### Config

`v2ctl config`

Нет параметров. Эта команда считывает конфигурацию в формате JSON из потока stdin, а выводит её в формате Protobuf в stdout.

### UUID

`v2ctl uuid`

Нет параметров. Эта команда выводит случайный UUID.