# Transport Settings

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/transport.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/05_transport.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/transport.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/transport.html)

Transport is for how V2Ray sends and receives data from its peers. The responsiblity of a transport is to reliably transfer data to a peer. Usually a connection has matching transports on both endpoints. For example, if a V2Ray outbound uses WebSocket as its transport, the inbound it talks to also has to use WebSocket, otherwise a connection can't be established.

The transport settings devides into two parts: global settings and per proxy settings. Per-proxy settings specifies how each individual proxy handles its data, while global settings is for all proxies. Usually the inbound and outbound proxies between the connecting peer must have the same transport settings. When a proxy has no transport settings, the global settings applies.

## Global Configuration {#global}

Global settings is in the "transport" entry of V2Ray config.

```javascript
{
  "tcpSettings": {},
  "kcpSettings": {},
  "wsSettings": {},
  "httpSettings": {},
  "dsSettings": {}
}
```

Where:

* `tcpSettings`: Settings for [TCP transport](transport/tcp.md).
* `kcpSettings`: Settings for [mKCP transport](transport/mkcp.md).
* `wsSettings`: Settings for [WebSocket transport](transport/websocket.md).
* `httpSettings`: Settings for [HTTP/2 transport](transport/h2.md).
* `dsSettings`: Settings for [Domain Socket transport](transport/domainsocket.md).

## Per-proxy Configuration {#proxy}

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
  "httpSettings": {},
  "dsSettings": {},
  "sockopt": {
    "mark": 0,
    "tcpFastOpen": false,
    "tproxy": "off"
  }
}
```

Where:

* `network`: Network type of the stream transport. Choices are `"tcp"`, `"kcp"`, `"ws"`, `"http"`, or `"domainsocket"`. Default value `"tcp"`.
* `security`: Type of security. Choices are `"none"` (default) for no extra security, or `"tls"` for using [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security).
* `tlsSettings`: TLS settings. TLS is provided by Golang. Support up to TLS 1.2. DTLS is not supported. 
  * `serverName`: Server name (usually domain) used for TLS authentication.
  * `alpn` (V2Ray 3.18+): An array of strings, to specifiy the ALPN value in TLS handshake. Default value is `["http/1.1"]`.
  * `allowInsecure`: If `true`, V2Ray allowss insecure connection at TLS client.
  * `allowInsecureCiphers` (V2Ray 3.24+): Whehter or not to allow insecure cipher suites. By default TLS only uses cipher suites from TLS 1.3 spec. Turn on this option to allow cipher suites with static RSA keys.
  * `certificates`: List of TLS certificates. Each entry is one certificate. 
    * `usage` (V2Ray 3.17+): Purpose of the certificate. Default value `"encipherment"`. Choices are: 
      * `"encipherment"`: Certificate is used for TLS authentication and encryption.
      * `"verify"`: Certificate is used for validating TLS certificates from remote peer. In this case, the certificate has to be a CA certificate. For now, Windows is not supported.
      * `"issue"`: Certificate is used for issuing other certificates. In this case, the certificate has to be a CA certificate.
    * `certificateFile`: File path to the certificate. If the certificate is generated by OpenSSL, the path ends with ".crt".
    * `certificate` (V2Ray 3.17+): List of strings as content of the certificate. See the example above. Either `certificate` or `certificateFile` must not be empty.
    * `keyFile`: File path to the private key. If generated by OpenSSL, the file usually ends with ".key". Key file with password is not supported.
    * `key` (V2Ray 3.17+): List of strings as content of the private key. See the example above. Either `key` or `keyFile` must not be empty.
* `tcpSettings`: TCP transport configuration for current proxy. Effective only when the proxy uses TCP transport. Configuration is the same as it is in global configuration.
* `kcpSettings`: mKCP transport configuration for current proxy. Effective only when the proxy uses mKCP transport. Configuration is the same as it is in global configuration.
* `wsSettings`: WebSocket transport configuration for current proxy. Effective only when the proxy uses WebSocket transport. Configuration is the same as it is in global configuration.
* `httpSettings`: HTTP/2 transport configuration for current proxy. Effective only when the proxy uses HTTP/2 transport. Configuration is the same as it is in global configuration.
* `dsSettings`: Domain socket transport configuration for current proxy. Effective only when the proxy uses domain socket transport.
* `sockopt` (V2Ray 3.40+): Socket options 
  * `mark`: An integer. If non-zero, the value will be set to outbound connections via socket option SO_MARK. Only apply on Linux and requires CAP_NET_ADMIN permission.
  * `tcpFastOpen`: Whether or not to enable [TCP Fast Open](https://en.wikipedia.org/wiki/TCP_Fast_Open). When set to `true`, V2Ray enables TFO for current connection. When set to `false`, V2Ray disables TFO. If this entry doesn't exist, V2Ray uses default settings from operating system. 
    * Only apply on the following operating systems: 
      * Windows 10 (1604) or later
      * Mac OS 10.11 / iOS 9 or later
      * Linux 3.16 or later: Enabled by system default.
    * Applicable for both inbound and outbound connections.
  * `tproxy` (V2Ray 3.44+): Whether or not to enable transparent proxy on Linux. Choices are: 
    * `"off"`: Default value. Not enable TProxy at all.
    * `"redirect"`: Enable TProxy with Redirect mode. Supports TCP/IPv4 and UDP traffic.
    * `"tproxy"`: Enable TProxy with TProxy mode. Supports TCP and UDP traffic.

## Tips {#tips}

* When `certificateFile` and `certificate` are both filled in. V2Ray uses `certificateFile`. Same for `keyFile` and `key`.
* When there is a new client request, say for `serverName` = `"v2ray.com"`, V2Ray will find a certificate for `"v2ray.com"` first. If not found, V2Ray will try to issue a new certificate using any existing certificate whose `usage` is `"issue"` for `"v2ray.com"`. The new certificate expires in one hour, and will be added to certificate pool for later reuse.
* When `usage` is `"verify"`, both `keyFile` and `key` can be empty.
* Use `v2ctl cert -ca` command to generate a new CA certificate.
* If `TProxy` is not set, and `allowRedirect` is set in [dokodemo-door](protocols/dokodemo.md), the value of `TProxy` will be set to `"redirect"` automatically.
* Transparent proxy requires Root or CAP\_NET\_ADMIN permission.