# Shadowsocks

![English](../../resources/englishc.svg) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/shadowsocks.html)

Протокол [Shadowsocks](https://www.shadowsocks.org/) поддерживает входящие и исходящие соединения.

Совместим с официальной версией:

* Поддерживает как TCP, так и UDP соединения. UDP может быть отключен.
* Поддержка [ OTA ](https://web.archive.org/web/20161221022225/https://shadowsocks.org/en/spec/one-time-auth.html). 
  * Клиент может отключать и включать поддержку при необходимости.
  * Сервер может включит, отключить поддержку или делать это автоматически.
* Методы шифрования (методы шифрования [AEAD](https://shadowsocks.org/en/spec/AEAD-Ciphers.html) добавлены в V2Ray 3.0): 
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
* Тип: входящий / исходящий

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

Где:

* `email`: Адрес электронной почты. Используется для идентификации пользователя.
* `method`: Метод шифрования. Значение по умолчанию не установлено. Возможные варианты: 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` или `"chacha20-ietf-poly1305"`
* `password`: Пароль. Может быть любым в форме строки.
* `udp` (Deprecated, use `network`): `true` or `false`, whether or not to enable UDP. Default to `false`.
* `level`: User level. Default to `0`. See [Policy](../policy.md).
* `ota`: `true` or `false`, whether or not to enable OTA. Default to auto mode. 
  * When AEAD is used, `ota` has no effect.
* `network` (V2Ray 3.16+): Type of network, either `"tcp"`, `"udp"`, or `"tcp,udp"`. Default to `"tcp"`.

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