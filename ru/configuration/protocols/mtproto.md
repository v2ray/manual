---
refcn: chapter_02/protocols/mtproto
refen: configuration/protocols/mtproto
---
# MTProto

* Название: `mtproto`
* Тип: входящий / исходящий

MTProto proxy - специальный прокол для Telegram. Он состоит из пары входящих и исходящих прокси в V2Ray. Они обычно используются вместе для создания прокси для Telegram.

На данный момент V2Ray поддерживает только IPv4 адрес сервера Telegram.

## InboundConfigurationObject

```javascript
{
  "users": [{
    "email": "love@v2ray.com",
    "level": 0,
    "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
  }]
}
```

> `users`: \[[UserObject](#userobject)\]

An array of users. For now only the first user is effective.

### UserObject

```javascript
{
  "email": "love@v2ray.com",
  "level": 0,
  "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
}
```

> `email`: string

Электронная почта пользователя. Используется для сбора статистики. См. [Статистика](../stats.md).

> `level`: number

Уровень пользователя.

> `secret`: string

User secret. In Telegram, user secret must be 32 characters long, and only contains characters between `0` to `9`, and `a`to `f`.

{% hint style='tip' %}

You may use the following command to generate MTProto secret: `openssl rand -hex 16`

{% endhint %}

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

The configure your Telegram app to connect to 443 port on this machine.