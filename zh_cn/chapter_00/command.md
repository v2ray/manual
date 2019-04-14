---
refcn: chapter_00/command
refen: welcome/command
---

# 命令行参数

## V2Ray

V2Ray 的程序文件的命令行参数如下：

```bash
v2ray [-version] [-test] [-config=config.json] [-format=json]
```

> `-version`

只输出当前版本然后退出，不运行 V2Ray 主程序。

> `-test`

测试配置文件有效性，如果有问题则输出错误信息，不运行 V2Ray 主程序。

> `-config`

配置文件路径，可选的形式如下:

* 本地路径，可以是一个绝对路径，或者相对路径。
* `"stdin:"`: 表示将从标准输入读取配置文件内容，调用者必须在输入完毕后关闭标准输入流。
* 以`http://`或`https://`(均为小写)开头: V2Ray 将尝试从这个远程地址加载配置文件。

> `-format`

配置文件格式，可选的值有：

* `json`: JSON 格式；
* `pb` 或 `protobuf`: Protobuf 格式；

{% hint style='info' %}
当`-config`没有指定时，V2Ray 将先后尝试从以下路径加载`config.json`:

* 工作目录（Working Directory）
* [环境变量](../chapter_02/env.md)中`v2ray.location.asset`所指定的路径

{% endhint %}

## V2Ctl

V2Ctl 是一个集合，它有若干个子命令组成。全局的命令行形式如下：

```bash
v2ctl <command> <options>
```

> `command`

子命令，有以下选项:

* `api`: 调用 V2Ray 进程的远程控制指令。
* `config`: 从标准输入读取 JSON 格式的配置，然后从标准输出打印 Protobuf 格式的配置。
* `cert`: 生成 TLS 证书。
* `fetch`: 抓取远程文件。
* `tlsping`: (V2Ray 4.17+) 尝试进行 TLS 握手。
* `verify`: 验证文件是否由 Project V 官方签名。
* `uuid`: 输出一个随机的 UUID。

### V2Ctl Api

`v2ctl api [--server=127.0.0.1:8080] <Service.Method> <Request>`

调用 V2Ray 进程的远程控制指令。示例：

`v2ctl api --server=127.0.0.1:8080 LoggerService.RestartLogger ''`

### V2Ctl Config

`v2ctl config`

此命令没有参数。它从标准输入读取 JSON 格式的配置，然后从标准输出打印 Protobuf 格式的配置。

### V2Ctl Cert

`v2ctl cert [--ca] [--domain=v2ray.com] [--expire=240h] [--name="V2Ray Inc"] [--org="V2Ray Inc] [--json] [--file=v2ray]`

生成一个 TLS 证书。

> `--ca`

如果指定此选项，将会生成一个 CA 证书。

> `--domain`

证书的 Alternative Name 项。该参数可以多次使用，来指定多个域名。比如`--domain=v2ray.com --domain=v2ray.cool`。

> `--expire`

证书有效期。格式为 Golang 的[时间长度](https://golang.org/pkg/time/#ParseDuration)。

> `--name`

证书的 Command Name 项。

> `--org`

证书的 Orgnization 项。

> `--json`

将生成的证书以 V2Ray 支持的 JSON 格式输出到标准输出。默认开启。

> `--file`

将证书以 PEM 格式输出到文件。当指定 `--file=a` 时，将生成 `a_cert.pem` 和 `a_key.pem` 两个文件。

### V2Ctl Fetch

`v2ctl fetch <url>`

抓取指定的 URL 的内容并输出，只支持 HTTP 和 HTTPS。

### V2Ctl TlsPing

`v2ctl tlsping <domain> --ip=[ip]`

向指定的域名发起 TLS 握手。

> domain

目标域名

> --ip

此域名的 IP 地址。如果未指定此参数，V2Ctl 将使用系统的 DNS 进行域名解析。

### V2Ctl Verify

`v2ctl verify [--sig=/path/to/sigfile] <filepath>`

此命令用于验证一个文件是否由 Project V 官方签名。

> `--sig`

签名文件路径，默认值为待验证文件加入'.sig'后缀。

> `filepath`

待验证文件路径。

### V2Ctl UUID

`v2ctl uuid`

此命令没有参数。每次运行都会输出一个新的 UUID。
