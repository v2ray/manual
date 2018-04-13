# Transport Settings

Transport settings is for how V2Ray sends and receives data from its peers. The settings devides into two parts: global settings and per proxy settings. Per-proxy settings specifies how each individual proxy handles its data, while global settings is for all proxies. Usually the inbound and outbound proxies between the connecting peer must have the same transport settings. When a proxy has no transport settings, the global settings applies.

## Global Configuration

Global settings is in the "transport" entry of V2Ray config.

```javascript
{
  "tcpSettings": {},
  "kcpSettings": {},
  "wsSettings": {},
  "httpSettings": {}
}
```

Where:

* `tcpSettings`: Settings for [TCP transport](transport/tcp.md)。
* `kcpSettings`: Settings for [mKCP transport](transport/mkcp.md)。
* `wsSettings`: Settings for [WebSocket transport](transport/websocket.md)。
* `httpSettings`: Settings for [HTTP/2 transport](transport/h2.md)。

## Per-proxy Configuration

Each inbound and outbound proxy may has its own transport settings. Each inbound, inboundDetour, outbound and outboundDetour entry may have a `streamSettings` for transport.

```javascript
{
  "network": "tcp",
  "security": "none",
  "tlsSettings": {
    "serverName": "v2ray.com",
    "alpn": ["http/1.1"],
    "allowInsecure": false,
    "certificates": [
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
    ]
  },
  "tcpSettings": {},
  "kcpSettings": {},
  "wsSettings": {},
  "httpSettings": {}
}
```

Where:

* `network`: Network type of the stream transport. Choices are `"tcp"`, `"kcp"`, `"ws"`, or `"http"`. Default value `"tcp"`.
* `security`: Type of security. Choices are `"none"` (default) for no extra security, or `"tls"` for using [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security).
* `tlsSettings`: TLS settings. TLS is provided by Golang. Support up to TLS 1.2. DTLS is not supported.
  * `serverName`: Server name (usually domain) used for TLS authentication.
  * `alpn` (V2Ray 3.18+): An array of strings, to specifiy the ALPN value in TLS handshake. Default value is `["http/1.1"]`.
  * `allowInsecure`: If `true`, V2Ray allowss insecure connection at TLS client.
  * `certificates`: 证书列表（用于服务器端），其中每一项表示一个证书：
    * `usage` (V2Ray 3.17+): 证书用途，默认值为`"encipherment"`，可选值如下：
      * `"encipherment"`: 证书用于 TLS 认证和加密。
      * `"verify"`: 证书用于验证远端 TLS 的证书。当使用此项时，当前证书必须为 CA 证书。暂不支持 Windows 平台。
      * `"issue"`: 证书用于签发其它证书。当使用此项时，当前证书必须为 CA 证书。
    * `certificateFile`: 证书文件，如使用 OpenSSL 生成，后缀名为 .crt。
    * `certificate` (V2Ray 3.17+): 证书内容，格式如样例所示。 `certificate` 和 `certificateFile` 二者选一。
    * `keyFile`: 密钥文件，如使用 OpenSSL 生成，后缀名为 .key。目前暂不支持需要密码的 key 文件。
    * `key` (V2Ray 3.17+): 密钥内容，格式如样例如示。 `key`和`keyFile`二者选一。
* `tcpSettings`: 当前连接的 TCP 配置，仅当此连接使用 TCP 时有效。配置内容与上面的全局配置相同。
* `kcpSettings`: 当前连接的 mKCP 配置，仅当此连接使用 mKCP 时有效。配置内容与上面的全局配置相同。
* `wsSettings`: 当前连接的 WebSocket 配置，仅当此连接使用 WebSocket 时有效。配置内容与上面的全局配置相同。
* `httpSettings`: 当前连接的 HTTP/2 配置，仅当此连接使用 HTTP/2 时有效。配置内容与上面的全局配置相同。

## 小贴示

* 当`certificateFile`和`certificate`同时指定时，V2Ray 优先使用`certificateFile`。`keyFile`和`key`也一样。
* 当有新的客户端请求时，假设所指定的`serverName`为`"v2ray.com"`，V2Ray 会先从证书列表中寻找可用于`"v2ray.com"`的证书，如果没有找到，则使用任一`usage`为`"issue"`的证书签发一个适用于`"v2ray.com"`的证书，有效期为一小时。并将新的证书加入证书列表，以供后续使用。
* 当`usage`为`"verify"`时，`keyFile`和`key`可均为空。
* 使用`v2ctl cert -ca`可以生成自签名的 CA 证书。
