# Shadowsocks

[![English][1]][2] [![Chinese][3]][4] [![German][5]][6] [![Russian][7]][8]

[1]: ../../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/protocols/shadowsocks.html
[3]: ../../resources/chinese.svg
[4]: https://www.v2ray.com/chapter_02/protocols/shadowsocks.html
[5]: ../../resources/german.svg
[6]: https://www.v2ray.com/de/configuration/protocols/shadowsocks.html
[7]: ../../resources/russian.svg
[8]: https://www.v2ray.com/ru/configuration/protocols/shadowsocks.html

[Shadowsocks](https://www.shadowsocks.org/) protocol, for both inbound and outbound connections.

Compatibility with official version:

* Supports both TCP and UDP connections, where UDP can be optional turned off.
* Supports [OTA](https://web.archive.org/web/20161221022225/https://shadowsocks.org/en/spec/one-time-auth.html)；
  * Client may choose to turn on or off.
  * Server may choose to enable, disable or auto.
* Encryption methods ([AEAD](https://shadowsocks.org/en/spec/AEAD-Ciphers.html) ciphers added in V2Ray 3.0):
  * aes-256-cfb
  * aes-128-cfb
  * chacha20
  * chacha20-ietf
  * aes-256-gcm
  * aes-128-gcm
  * chacha20-poly1305 a.k.a. chacha20-ietf-poly1305
* Plugins：
  * Support obfs through standalone mode.

Info:

* Name: shadowsocks
* Type: Inbound / Outbound

## Inbound proxy configuration

```javascript
{
  "email": "love@v2ray.com",
  "method": "aes-128-cfb",
  "password": "password",
  "udp": false,
  "level": 0,
  "ota": true,
  "network": "tcp"
}
```

Where:

* `email`: Email address. Used for user identification.
* `method`: Encryption method. No default value. Options are:
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` or `"chacha20-ietf-poly1305"`
* `password`: Password. Can be any string.
* `udp` (Deprecated, use `network`): `true` or `false`, whether or not to enable UDP. Default to `false`.
* `level`: User level. Default to `0`. See [Policy](../policy.md).
* `ota`: `true` or `false`, whether or not to enable OTA.
  * When AEAD is used, `ota` has no effect.
  * When this entry is not specified at all, Shadowsocks inbound detects client settings and then act accordingly.
  * When this is set to `true` (or `false`) but client is set in the other way, Shadowsocks inbound disconnects connection immediately.
* `network`: Type of network, either `"tcp"`, `"udp"`, or `"tcp,udp"`. Default to `"tcp"`.

## Outbound proxy configuration

```javascript
{
  "servers": [
    {
      "email": "love@v2ray.com",
      "address": "127.0.0.1",
      "port": 1234,
      "method": "method",
      "password": "password",
      "ota": false,
      "level": 0
    }
  ]
}
```

Where:

* `email`: Email address. Used for user identification.
* `address`: Address of Shadowsocks server. Can be IPv4, IPv6 or domain.
* `port`: Port of Shadowsocks server.
* `method`: Encryption method. No default value. Options are:
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` or `"chacha20-ietf-poly1305"`
* `password`: Password. Can be any string.
* `ota`: Whether or not to use OTA.
  * When AEAD is used, `ota` has no effect.
* `level`: User level.
