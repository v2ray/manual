---
refcn: chapter_02/protocols/mtproto
refen: configuration/protocols/mtproto
---
# MTProto

MTProto proxy is a special procol for Telegram. It consists of a pair of inbound and outboud proxies in V2Ray. They are usually used together for building a proxy for Telegram

**На данный момент V2Ray поддерживает только IPv4 адрес сервера Telegram.**

Описание протокола:

* Название: mtproto
* Тип: входящий / исходящий

## Конфигурация входящего соединения {#inbound}

```javascript
{
  "users": [{
    "email": "love@v2ray.com",
    "level": 0,
    "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
  }]
}
```

Where:

* `users`: Массив пользователей. **For now only the first user is effective**. Each user has the following configuration: 
  * `email`: User email. Used for tracking purposes. See [Stats](../stats.md).
  * ` userLevel `: Пользовательский уровень.
  * `secret`: User secret. In Telegram, user secret must be 32 characters long, and only contains characters between `0` to `9`, and `a`to `f`.

## Конфигурация исходящего соединения {#outbound}

```javascript
{
}
```

## Пример {#sample}

MTProto can only be used for Telegram traffic. You may need a routing rule to combine the corresponding inbound and outbound. Here is an incomplete sample.

Входящее соединение:

```javascript
{
  "tag": "tg-in",
  "port": 443,
  "protocol": "mtproto",
  "settings": {
    "users": [{"secret": "b0cbcef5a486d9636472ac27f8e11a9d"}]
  }
}
```

Исходящее соединение:

```javascript
{
  "tag": "tg-out",
  "protocol": "mtproto",
  "settings": {}
}
```

Маршрутизация:

```javascript
{
  "type": "field",
  "inboundTag": ["tg-in"],
  "outboundTag": "tg-out"
}
```

Конфигурируйте приложение Telegram для подключения к порту 443 на этом устройстве.

## Tips {#tips}

* Используйте эту команду для генерации секрета MTProto: ` openssl rand -hex 16 `.