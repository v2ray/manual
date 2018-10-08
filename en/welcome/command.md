---
refcn: chapter_00/command
refen: welcome/command
---

# Commandline

[![English][1]][2] [![Chinese][3]][4] [![German][5]][6] [![Russian][7]][8]

[1]: ../resources/english.svg
[2]: https://www.v2ray.com/en/welcome/command.html
[3]: ../resources/chinese.svg
[4]: https://www.v2ray.com/chapter_00/command.html
[5]: ../resources/german.svg
[6]: https://www.v2ray.com/de/welcome/command.html
[7]: ../resources/russian.svg
[8]: https://www.v2ray.com/ru/welcome/command.html

## V2Ray

V2Ray has the following commandline parameters:

```shell
v2ray [-version] [-test] [-config=config.json] [-format=json]
```

Where:

* `-version`: Print the version of V2Ray only, and then exit.
* `-test`: Test configuration, output any errors and then exit.
* `-config`: URI of the configuration.
  * When its value is `stdin:`, V2Ray reads configuration from standard input. Caller must close stdin after writing out configuration.
  * When its value begins with `http://` or `https://` (lowercase), V2Ray tries to load configuration from the remote address.
  * When not set, V2Ray first tries to load configuration from `config.json` under working directory, then from the directory specified by environment variable `v2ray.location.asset`.
* `-format`: Configuration format. Choices are:
  * `json`: JSON format.
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

Options:

* `sig`：Path to signature file. Default value is the ".sig" file to the path to be verified.
* First argument: the file to be verified.

### Config

`v2ctl config`

No options. This command reads configuration in JSON format from stdin, and then write corresponding configuration in Protobuf format to stdout.

### UUID

`v2ctl uuid`

No options. This command prints a random UUID.
