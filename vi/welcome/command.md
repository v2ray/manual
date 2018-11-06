---
refcn: chapter_00/command
refen: welcome/command
---
# Commandline

## V2Ray

V2Ray has the following commandline parameters:

```shell
v2ray [-version] [-test] [-config=config.json] [-format=json]
```

> `-version`

Print the version of V2Ray only, and then exit.

> `-test`

Test configuration, output any errors and then exit.

> `-config`:

URI of the configuration. Avilable formats are:

* Path to the local config file. May be a relative path or absolute path.
* `"stdin:"`: Indicates V2Ray to read configuration from standard input. Caller must close stdin after writing out configuration.
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