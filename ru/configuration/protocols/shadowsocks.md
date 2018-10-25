---
refcn: chapter_02/protocols/shadowsocks
refen: configuration/protocols/shadowsocks
---
# Shadowsocks

Протокол [Shadowsocks](https://www.shadowsocks.org/) поддерживает входящие и исходящие соединения.

Совместим с официальной версией:

* Поддерживает как TCP, так и UDP соединения. UDP может быть отключен.
* Поддерживает [OTA](https://web.archive.org/web/20161221022225/https://shadowsocks.org/en/spec/one-time-auth.html)； 
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
* `method`: Метод шифрования. Значение по умолчанию отсутствует. Возможные варианты: 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` или `"chacha20-ietf-poly1305"`
* `password`: Пароль. Может быть любой строкой.
* `udp` (Устарел, используйте `network`): `true` для включения и `false` для выключения UDP. По умолчанию `false`.
* `level`: Пользовательский уровень. По умолчанию `0`. См. [Локальная политика](../policy.md).
* `ota`: `true` или `false`, использовать или не использовать OTA. 
  * Когда используется AEAD, значение ` ota ` не используется.
  * Если значение не установлено, Shadowsocks использует значение, установленное клиентом.
  * Если установлено `true` или `false`, а при этом у клиента установлено противоположное значение, соединение автоматически разрывается сервером.
* `network`: Тип сети. `"tcp"`, `"udp"`, или `"tcp,udp"`. По умолчанию - `"tcp"`.

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