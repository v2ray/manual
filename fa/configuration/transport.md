---
refcn: chapter_02/05_transport
refen: configuration/transport
---
# تنظیمات حمل و نقل

حمل و نقل این است که چگونه V2Ray ارسال و دریافت داده ها از همتایان خود را. The responsibility of a transport is to reliably transfer data to a peer. معمولا یک ارتباط با ترانسپورت در هر دو نقطه انتهایی دارد. به عنوان مثال، اگر یک خروجی V2Ray با استفاده از WebSocket به عنوان حمل و نقل آن، ورودی آن صحبت می کند، همچنین باید از WebSocket استفاده کند، در غیر این صورت یک اتصال نمی تواند برقرار شود.

تنظیمات حمل و نقل به دو قسمت تقسیم می شود: تنظیمات جهانی و تنظیمات پراکسی. تنظیمات هر پروکسی مشخص می کند که چگونه هر یک از پروکسی ها اطلاعات خود را مدیریت می کند، در حالی که تنظیمات جهانی برای همه پروکسی ها است. معمولا پروکسی های ورودی و خروجی بین همتراز اتصال باید تنظیمات حمل و نقل مشابه داشته باشند. هنگامی که یک پروکسی هیچ تنظیمات حمل و نقل ندارد، تنظیمات جهانی اعمال می شود.

## TransportObject

`TransportObject` به عنوان `انتقال` فیلد در پیکربندی سطح بالا استفاده می شود.

```javascript
{
  "tcpSettings": {},
  "kcpSettings": {},
  "wsSettings": {},
  "httpSettings": {},
  "dsSettings": {},
  "quicSettings": {}
}
```

> `tcpSettings`: TcpObject

تنظیمات [TCP transport](transport/tcp.md).

> `kcpSettings`: KcpObject

تنظیمات حمل و نقل [mKCP](transport/mkcp.md).

> `wsSettings`: WebSocketObject

تنظیمات برای [حمل و نقل WebSocket](transport/websocket.md).

> `httpSettings`: HttpObject

تنظیمات [HTTP / 2 حمل و نقل](transport/h2.md).

> `dsSettings`: DomainSocketObject

تنظیمات برای [Domain Socket Transport](transport/domainsocket.md).

> `quicSettings`: QUICObject

Settings for [QUIC transport](transport/quic.md).

## StreamSettingsObject

Each inbound and outbound proxy may has its own transport settings, as specified in `streamSettings` field in top level configuration.

```javascript
{
  "network": "tcp",
  "security": "none",
  "tlsSettings": {},
  "tcpSettings": {},
  "kcpSettings": {},
  "wsSettings": {},
  "httpSettings": {},
  "dsSettings": {},
  "quicSettings": {},
  "sockopt": {
    "mark": 0,
    "tcpFastOpen": false,
    "tproxy": "off"
  }
}
```

> `network`: "tcp" | "kcp" | "ws" | "http" | "domainsocket" | "quic"

Network type of the stream transport. Default value `"tcp"`.

> `security`: "none" | "tls"

Type of security. Choices are `"none"` (default) for no extra security, or `"tls"` for using [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security).

> `tlsSettings`: [TLSObject](#tlsobject)

TLS settings. TLS is provided by Golang. Support up to TLS 1.2. DTLS is not supported.

> `tcpSettings`: [TcpObject](transport/tcp.md)

TCP transport configuration for current proxy. Effective only when the proxy uses TCP transport. Configuration is the same as it is in global configuration.

> `kcpSettings`: KcpObject

mKCP transport configuration for current proxy. Effective only when the proxy uses mKCP transport. Configuration is the same as it is in global configuration.

> `wsSettings`: WebSocketObject

WebSocket transport configuration for current proxy. Effective only when the proxy uses WebSocket transport. Configuration is the same as it is in global configuration.

> `httpSettings`: HttpObject

HTTP/2 transport configuration for current proxy. Effective only when the proxy uses HTTP/2 transport. Configuration is the same as it is in global configuration.

> `dsSettings`: DomainSocketObject

Domain socket transport configuration for current proxy. Effective only when the proxy uses domain socket transport. Configuration is the same as it is in global configuration.

> `quicSettings`: QUICObject

QUIC transport configuration for current proxy. Effective only when the proxy uses QUIC transport. Configuration is the same as it is in global configuration.

> `sockopt`: SockoptObject

Socket options for incoming and out-going connections.

### TLSObject

```javascript
{
  "serverName": "v2ray.com",
  "allowInsecure": false,
  "alpn": ["http/1.1"],
  "certificates": []
}
```

> `serverName`: string

Server name (usually domain) used for TLS authentication. Typically this is used when corressponding inbound/outbound uses IP for communication.

> `alpn`: \[ string \]

An array of strings, to specifiy the ALPN value in TLS handshake. Default value is `["http/1.1"]`.

> `allowInsecure`: true | false

If `true`, V2Ray allowss insecure connection at TLS client, e.g., TLS server uses unverifiable certificates.

> `allowInsecureCiphers`: true | false

Whehter or not to allow insecure cipher suites. By default TLS only uses cipher suites from TLS 1.3 spec. Turn on this option to allow cipher suites with static RSA keys.

> `certificates`: \[ [CertificateObject](#certificateobject) \]

List of TLS certificates. Each entry is one certificate.

### CertificateObject

```javascript
{
  "usage": "encipherment",

  "certificateFile": "/path/to/certificate.crt",
  "keyFile": "/path/to/key.key",

  "certificate": [
    "-----BEGIN CERTIFICATE-----",
    "MIICwDCCAaigAwIBAgIRAO16JMdESAuHidFYJAR/7kAwDQYJKoZIhvcNAQELBQAw",
    "ADAeFw0xODA0MTAxMzU1MTdaFw0xODA0MTAxNTU1MTdaMAAwggEiMA0GCSqGSIb3",
    "DQEBAQUAA4IBDwAwggEKAoIBAQCs2PX0fFSCjOemmdm9UbOvcLctF94Ox4BpSfJ+",
    "3lJHwZbvnOFuo56WhQJWrclKoImp/c9veL1J4Bbtam3sW3APkZVEK9UxRQ57HQuw",
    "OzhV0FD20/0YELou85TwnkTw5l9GVCXT02NG+pGlYsFrxesUHpojdl8tIcn113M5",
    "pypgDPVmPeeORRf7nseMC6GhvXYM4txJPyenohwegl8DZ6OE5FkSVR5wFQtAhbON",
    "OAkIVVmw002K2J6pitPuJGOka9PxcCVWhko/W+JCGapcC7O74palwBUuXE1iH+Jp",
    "noPjGp4qE2ognW3WH/sgQ+rvo20eXb9Um1steaYY8xlxgBsXAgMBAAGjNTAzMA4G",
    "A1UdDwEB/wQEAwIFoDATBgNVHSUEDDAKBggrBgEFBQcDATAMBgNVHRMBAf8EAjAA",
    "MA0GCSqGSIb3DQEBCwUAA4IBAQBUd9sGKYemzwPnxtw/vzkV8Q32NILEMlPVqeJU",
    "7UxVgIODBV6A1b3tOUoktuhmgSSaQxjhYbFAVTD+LUglMUCxNbj56luBRlLLQWo+",
    "9BUhC/ow393tLmqKcB59qNcwbZER6XT5POYwcaKM75QVqhCJVHJNb1zSEE7Co7iO",
    "6wIan3lFyjBfYlBEz5vyRWQNIwKfdh5cK1yAu13xGENwmtlSTHiwbjBLXfk+0A/8",
    "r/2s+sCYUkGZHhj8xY7bJ1zg0FRalP5LrqY+r6BckT1QPDIQKYy615j1LpOtwZe/",
    "d4q7MD/dkzRDsch7t2cIjM/PYeMuzh87admSyL6hdtK0Nm/Q",
    "-----END CERTIFICATE-----"
  ],
  "key": [
    "-----BEGIN RSA PRIVATE KEY-----",
    "MIIEowIBAAKCAQEArNj19HxUgoznppnZvVGzr3C3LRfeDseAaUnyft5SR8GW75zh",
    "bqOeloUCVq3JSqCJqf3Pb3i9SeAW7Wpt7FtwD5GVRCvVMUUOex0LsDs4VdBQ9tP9",
    "GBC6LvOU8J5E8OZfRlQl09NjRvqRpWLBa8XrFB6aI3ZfLSHJ9ddzOacqYAz1Zj3n",
    "jkUX+57HjAuhob12DOLcST8np6IcHoJfA2ejhORZElUecBULQIWzjTgJCFVZsNNN",
    "itieqYrT7iRjpGvT8XAlVoZKP1viQhmqXAuzu+KWpcAVLlxNYh/iaZ6D4xqeKhNq",
    "IJ1t1h/7IEPq76NtHl2/VJtbLXmmGPMZcYAbFwIDAQABAoIBAFCgG4phfGIxK9Uw",
    "qrp+o9xQLYGhQnmOYb27OpwnRCYojSlT+mvLcqwvevnHsr9WxyA+PkZ3AYS2PLue",
    "C4xW0pzQgdn8wENtPOX8lHkuBocw1rNsCwDwvIguIuliSjI8o3CAy+xVDFgNhWap",
    "/CMzfQYziB7GlnrM6hH838iiy0dlv4I/HKk+3/YlSYQEvnFokTf7HxbDDmznkJTM",
    "aPKZ5qbnV+4AcQfcLYJ8QE0ViJ8dVZ7RLwIf7+SG0b0bqloti4+oQXqGtiESUwEW",
    "/Wzi7oyCbFJoPsFWp1P5+wD7jAGpAd9lPIwPahdr1wl6VwIx9W0XYjoZn71AEaw4",
    "bK4xUXECgYEA3g2o9WqyrhYSax3pGEdvV2qN0VQhw7Xe+jyy98CELOO2DNbB9QNJ",
    "8cSSU/PjkxQlgbOJc8DEprdMldN5xI/srlsbQWCj72wXxXnVnh991bI2clwt7oYi",
    "pcGZwzCrJyFL+QaZmYzLxkxYl1tCiiuqLm+EkjxCWKTX/kKEFb6rtnMCgYEAx0WR",
    "L8Uue3lXxhXRdBS5QRTBNklkSxtU+2yyXRpvFa7Qam+GghJs5RKfJ9lTvjfM/PxG",
    "3vhuBliWQOKQbm1ZGLbgGBM505EOP7DikUmH/kzKxIeRo4l64mioKdDwK/4CZtS7",
    "az0Lq3eS6bq11qL4mEdE6Gn/Y+sqB83GHZYju80CgYABFm4KbbBcW+1RKv9WSBtK",
    "gVIagV/89moWLa/uuLmtApyEqZSfn5mAHqdc0+f8c2/Pl9KHh50u99zfKv8AsHfH",
    "TtjuVAvZg10GcZdTQ/I41ruficYL0gpfZ3haVWWxNl+J47di4iapXPxeGWtVA+u8",
    "eH1cvgDRMFWCgE7nUFzE8wKBgGndUomfZtdgGrp4ouLZk6W4ogD2MpsYNSixkXyW",
    "64cIbV7uSvZVVZbJMtaXxb6bpIKOgBQ6xTEH5SMpenPAEgJoPVts816rhHdfwK5Q",
    "8zetklegckYAZtFbqmM0xjOI6bu5rqwFLWr1xo33jF0wDYPQ8RHMJkruB1FIB8V2",
    "GxvNAoGBAM4g2z8NTPMqX+8IBGkGgqmcYuRQxd3cs7LOSEjF9hPy1it2ZFe/yUKq",
    "ePa2E8osffK5LBkFzhyQb0WrGC9ijM9E6rv10gyuNjlwXdFJcdqVamxwPUBtxRJR",
    "cYTY2HRkJXDdtT0Bkc3josE6UUDvwMpO0CfAETQPto1tjNEDhQhT",
    "-----END RSA PRIVATE KEY-----"
  ]
}
```

> `usage`: "encipherment" | "verify" | "issue"

Purpose of the certificate. Default value `"encipherment"`. Choices are:

* `"رمزگذاری"`: گواهی برای احراز هویت و رمزگذاری TLS استفاده می شود.
* `"verify"`: گواهی برای اعتبار سنجی گواهی TLS از همکار راه دور استفاده می شود. در این مورد گواهی باید یک گواهینامه CA باشد.
* `"issue"`: گواهی برای صدور گواهی های دیگر استفاده می شود. در این مورد گواهی باید یک گواهینامه CA باشد.

{% hint style='info' %}

On Windows, you have to install your CA certificate to system, in order to verify cerificates issued from the CA.

{% endhint %}

{% hint style='info' %}

When there is a new client request, say for `serverName` = `"v2ray.com"`, V2Ray will find a certificate for `"v2ray.com"` first. If not found, V2Ray will try to issue a new certificate using any existing certificate whose `usage` is `"issue"` for `"v2ray.com"`. The new certificate expires in one hour, and will be added to certificate pool for later reuse.

{% endhint %}

> `certificateFile`: string

File path to the certificate. If the certificate is generated by OpenSSL, the path ends with ".crt".

{% hint style='info' %}

Use `v2ctl cert -ca` command to generate a new CA certificate.

{% endhint %}

> `certificate`: \[ string \]

List of strings as content of the certificate. See the example above. Either `certificate` or `certificateFile` must not be empty.

> `keyFile`: string

File path to the private key. If generated by OpenSSL, the file usually ends with ".key". Key file with password is not supported.

> `key`: \[ string \]

List of strings as content of the private key. See the example above. Either `key` or `keyFile` must not be empty.

When `certificateFile` and `certificate` are both filled in. V2Ray uses `certificateFile`. Same for `keyFile` and `key`.

{% hint style='info' %}

When `usage` is `"verify"`, both `keyFile` and `key` can be empty.

{% endhint %}

### SockoptObject

```javascript
{
  "mark": 0,
  "tcpFastOpen": false,
  "tproxy": "off"
}
```

> `mark`: number

An integer. If non-zero, the value will be set to out-going connections via socket option SO_MARK. This mechanism only applies on Linux and requires CAP_NET_ADMIN permission.

> `tcpFastOpen`: true | false

Whether or not to enable [TCP Fast Open](https://en.wikipedia.org/wiki/TCP_Fast_Open). When set to `true`, V2Ray enables TFO for current connection. When set to `false`, V2Ray disables TFO. If this entry doesn't exist, V2Ray uses default settings from operating system.

* فقط در سیستم عامل های زیر اعمال می شود: 
  * ویندوز 10 (1604) یا بعدا
  * سیستم عامل مک 10.11 / iOS 9 یا بالاتر
  * لینوکس 3.16 یا بالاتر: به طور پیش فرض توسط سیستم فعال شده است.
* قابل اجرا برای اتصالات ورودی و خروجی.

> `tproxy`: "redirect" | "tproxy" | "off"

Whether or not to enable transparent proxy on Linux. Choices are:

* `"خاموش"`: مقدار پیش فرض. TProxy را فعال نکنید.
* `"redirect"`: فعال کردن TProxy با حالت Redirect پشتیبانی از ترافیک TCP / IPv4 و UDP.
* `"tproxy"`: TProxy را با حالت TProxy فعال کنید. پشتیبانی از ترافیک TCP و UDP.

Transparent proxy requires Root or CAP\_NET\_ADMIN permission.

{% hint style='info' %}

If `TProxy` is not set, and `allowRedirect` is set in [dokodemo-door](protocols/dokodemo.md), the value of `TProxy` will be set to `"redirect"` automatically.

{% endhint %}