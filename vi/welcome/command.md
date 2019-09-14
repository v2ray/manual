---
refcn: chapter_00/command
refen: welcome/command
---

# Dòng lệnh

## V2Ray

V2Ray có các tham số dòng lệnh sau:

```shell
v2ray [-version] [-test] [-config=config.json] [-format=json]
```

> `-phiên bản`

Chỉ in phiên bản V2Ray và sau đó thoát.

> `-kiểm tra`

Kiểm tra cấu hình, xuất ra bất kỳ lỗi nào và sau đó thoát ra.

> `-config`

URI của cấu hình. Định dạng Avilable là:

* Đường dẫn đến tệp cấu hình cục bộ. Có thể là đường dẫn tương đối hoặc đường dẫn tuyệt đối.
* `"stdin:"`: Cho biết V2Ray để đọc cấu hình từ đầu vào tiêu chuẩn. Người gọi phải đóng stdin sau khi viết cấu hình.
* Giá trị bắt đầu bằng `http: //` hoặc `https: //` (chữ thường): V2Ray cố tải cấu hình từ địa chỉ từ xa.

> `-định dạng`

Định dạng cấu hình. Lựa chọn là:

* `json`: Định dạng JSON.
* `pb` hoặc `protobuf`: Định dạng Protobuf.

{% hint style='info' %}

Khi `-config` không được chỉ định, V2Ray đầu tiên cố gắng tải cấu hình từ `config.json` trong thư mục làm việc, sau đó từ thư mục được chỉ định bởi [biến môi trường](../configuration/env.md) `v2ray.location.asset`.

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