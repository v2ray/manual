---
refcn: chapter_02/protocols/shadowsocks
refen: configuration/protocols/shadowsocks
---
# Shadowsocks

Протокол [Shadowsocks](https://www.shadowsocks.org/) поддерживает входящие и исходящие соединения.

Совместим с официальной версией:

* Поддерживает как TCP, так и UDP соединения. UDP может быть отключен.
* Supports [OTA](https://web.archive.org/web/20161221022225/https://shadowsocks.org/en/spec/one-time-auth.html)； 
  * Клиент может отключать и включать поддержку при необходимости.
  * Сервер может принудительно включить, отключить поддержку или использовать конфигурация клиента.
* Encryption methods ([AEAD](https://shadowsocks.org/en/spec/AEAD-Ciphers.html) ciphers added in V2Ray 3.0): 
  * aes-256-cfb
  * aes-128-cfb
  * chacha20
  * chacha20-ietf
  * aes-256-gcm
  * aes-128-gcm
  * chacha20-poly1305 a.k.a. chacha20-ietf-poly1305
* Плагины: 
  * Поддержка obfs через автономный режим.

Информация:

* Название: shadowsocks
* Type: Inbound / Outbound

## Конфигурация прокси для входящего соединения

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
  * `"chacha20-poly1305"` или `"chacha20-ietf-poly1305"`
* `password`: Password. Can be any string.
* `udp` (Deprecated, use `network`): `true` or `false`, whether or not to enable UDP. Default to `false`.
* `level`: User level. Default to `0`. See [Policy](../policy.md).
* `ota`: `true` or `false`, whether or not to enable OTA. 
  * Когда используется AEAD, значение ` ota ` не используется.
  * Если значение не установлено, Shadowsocks использует значение, установленное клиентом.
  * Если установлено `true` или `false`, а при этом у клиента установлено противоположное значение, соединение автоматически разрывается сервером.
* `network`: Type of network, either `"tcp"`, `"udp"`, or `"tcp,udp"`. Default to `"tcp"`.

## Конфигурация прокси для исходящего соединения

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
* `port`: Порт используемый Shadowsocks сервером.
* `method`: Encryption method. No default value. Options are: 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` or `"chacha20-ietf-poly1305"`
* `password`: Password. Can be any string.
* `ota`: Использовать или не использовать OTA. 
  * When AEAD is used, `ota` has no effect.
* `level`: User level.