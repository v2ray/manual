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

> `-config`

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

V2Ctl is a collection of commandline tools. It runs in the following way:

```bash
v2ctl <command> <options>
```

> `command`

Subcommand. Available values are below:

* `api`: Invoke remote control commands in V2Ray instances.
* `config`: Convert configuration from JSON format to protobuf.
* `cert`: Generate TLS certificates.
* `fetch`: Fetch remove resources.
* `tlsping`: (V2Ray 4.17+) Test TLS handshake.
* `verify`: Verify the signature of V2Ray releases.
* `uuid`: Generate UUID.

### V2Ctl Api

`v2ctl api [--server=127.0.0.1:8080] <Service.Method> <Request>`

Invoke remote control commands in V2Ray instances. Example:

`v2ctl api --server=127.0.0.1:8080 LoggerService.RestartLogger ''`

### V2Ctl Config

`v2ctl config`

No option for this command. It reads JSON configuration from stdin, and print out corresponding Protobuf to stdout, if succeeds.

### V2Ctl Cert

`v2ctl cert [--ca] [--domain=v2ray.com] [--expire=240h] [--name="V2Ray Inc"] [--org="V2Ray Inc] [--json] [--file=v2ray]`

Generates a TLS certificate based on options.

> `--ca`

If specified, the certificate will be a CA certificate.

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