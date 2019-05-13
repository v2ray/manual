---
refcn: chapter_02/protocols/shadowsocks
refen: configuration/protocols/shadowsocks
---

# Shadowsocks

* Name: `shadowsocks`
* Тип: входящий / исходящий

Протокол [Shadowsocks](https://www.shadowsocks.org/) поддерживает входящие и исходящие соединения.

Совместим с официальной версией:

* Поддерживает как TCP, так и UDP соединения. UDP может быть отключен.
* Поддерживает [OTA](https://web.archive.org/web/20161221022225/https://shadowsocks.org/en/spec/one-time-auth.html) 
  * Клиент может отключать и включать поддержку при необходимости.
  * Сервер может принудительно включить, отключить поддержку или использовать конфигурация клиента.
* Методы шифрования ([AEAD](https://shadowsocks.org/en/spec/AEAD-Ciphers.html) шифры, добавленные в V2Ray 3.0): 
  * aes-256-cfb
  * aes-128-cfb
  * chacha20
  * chacha20-ietf
  * aes-256-gcm
  * aes-128-gcm
  * chacha20-poly1305 a.k.a. chacha20-ietf-poly1305
* Плагины: 
  * Поддержка obfs через автономный режим.

## InboundConfigurationObject

```javascript
{
  "email": "love@v2ray.com",
  "method": "aes-128-cfb",
  "password": "password",
  "level": 0,
  "ota": true,
  "network": "tcp"
}
```

> `email`: string

Адрес электронной почты. Используется для идентификации пользователя.

> `method`: string

Required. See [Encryption methods](#encryption-methods) for available values.

> `password`: string

Required. Password in Shadowsocks protocol. Can be any string.

> `level`: number

Пользовательский уровень. По умолчанию `0`. См. [Локальная политика](../policy.md).

> `ota`: `true` | `false`

Whether or not to force OTA. If `true` and the incoming connection doesn't enable OTA, V2Ray will reject this connection. Vice versa.

If this field is not specified, V2Ray auto detects OTA settings from incoming connections.

Когда используется шифрование AEAD, значение `ota` не используется.

> `network`: "tcp" | "udp" | "tcp,udp"

Проксируемые протоколы. По умолчанию `"tcp"`.

## OutboundConfigurationObject

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

Где:

* `email`: Адрес электронной почты. Используется для идентификации пользователя.
* `address`: Адрес сервера Shadowsocks. Может быть IPv4, IPv6 или доменом.
* `port`: Порт используемый Shadowsocks сервером.
* `method`: Метод шифрования. Значение по умолчанию отсутствует. Возможные варианты: 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` или `"chacha20-ietf-poly1305"`
* `password`: Пароль. Может быть любой строкой.
* `ota`: Использовать или не использовать OTA. 
  * Когда используется AEAD, значение ` ota ` не используется.
* ` userLevel `: Пользовательский уровень.

> `servers`: \[[ServerObject](#serverobject)\]

An array of [ServerObject](#serverobject)s.

### ServerObject

```javascript
{
  "email": "love@v2ray.com",
  "address": "127.0.0.1",
  "port": 1234,
  "method": "加密方式",
  "password": "密码",
  "ota": false,
  "level": 0
}
```

> `email`: string

Адрес электронной почты. Используется для идентификации пользователя.

> `address`: address

Required. Shadowsocks server address. May be IPv4, IPv6 or domain address.

> `port`: number

Required. Shadowsocks server port.

> `method`: string

Required. See [Encryption methods](#encryption-methods) for available values.

> `password`: string

Required. Password in Shadowsocks protocol. Can be any string.

> `ota`: true | false

Whether or not to use OTA. Default value is `false`.

Если используется шифрование AEAD, это поле не используется.

> `level`: number

Уровень пользователя.

## Методы шифрования

* `"aes-256-cfb"`
* `"aes-128-cfb"`
* `"chacha20"`
* `"chacha20-ietf"`
* `"aes-256-gcm"`
* `"aes-128-gcm"`
* `"chacha20-poly1305"` или `"chacha20-ietf-poly1305"`