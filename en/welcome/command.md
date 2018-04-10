# Commandline

![English](../resources/englishc.svg) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/command.html)

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
  * (3.17+) When its value begins with `http://` or `https://` (lowercase), V2Ray tries to load configuration from the remote address.
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

`v2ray uuid`

No options. This command prints a random UUID.
