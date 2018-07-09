# Shadowsocks

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/protocols/shadowsocks.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/shadowsocks.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/protocols/shadowsocks.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/protocols/shadowsocks.html) [![Translate](../resources/lang.svg)](https://crowdin.com/project/v2ray)

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
* `udp` (Устарел, используйте `network`): `true` для включения и `false` для выключения UDP. Значение по умолчанию: `false`.
* ` userLevel `: Пользовательский уровень. Значение по умолчанию: `0`. См. [Локальная политика](../policy.md).
* `ota`: `true` or `false`, whether or not to enable OTA. 
  * Когда используется AEAD, значение ` ota ` не используется.
  * When this entry is not specified at all, Shadowsocks inbound detects client settings and then act accordingly.
  * When this is set to `true` (or `false`) but client is set in the other way, Shadowsocks inbound disconnects connection immediately.
* `network`: Type of network, either `"tcp"`, `"udp"`, or `"tcp,udp"`. Значение по умолчанию: `tcp`.

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

Где:

* `email`: Адрес электронной почты. Используется для идентификации пользователя.
* ` address `: Адрес сервера Shadowsocks. Может быть IPv4, IPv6 или домен.
* `port`: Порт используемый Shadowsocks сервером.
* `method`: Метод шифрования. Значение по умолчанию не установлено. Возможные варианты: 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` или `"chacha20-ietf-poly1305"`
* `password`: Пароль. Может быть любым в форме строки.
* `ota`: Использовать или не использовать OTA. 
  * Когда используется AEAD, значение ` ota ` не используется.
* ` userLevel `: Пользовательский уровень.