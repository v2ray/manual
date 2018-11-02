---
refcn: chapter_02/protocols/mtproto
refen: configuration/protocols/mtproto
---
# MTProto

* Name: `mtproto`
* Тип: входящий / исходящий

MTProto proxy - специальный прокол для Telegram. Он состоит из пары входящих и исходящих прокси в V2Ray. Они обычно используются вместе для создания прокси для Telegram.

For now V2Ray only supports IPv4 address of Telegram server.

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

User email. Used for tracking purposes. See [Stats](../stats.md).

> `level`: number

User level.

> `secret`: string

User secret. In Telegram, user secret must be 32 characters long, and only contains characters between `0` to `9`, and `a`to `f`.

{% hint style='info' %} 使用此命令生成 MTProto 代理所需要的用户密钥：`openssl rand -hex 16` {% endhint %}

## Конфигурация исходящего соединения {#outbound}

```javascript
{
}
```

## Пример {#sample}

MTProto can only be used for Telegram traffic. You may need a routing rule to combine the corresponding inbound and outbound. Here is an incomplete sample.

Inbound:

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

Outbound:

```javascript
{
  "tag": "tg-out",
  "protocol": "mtproto",
  "settings": {}
}
```

Routing:

```javascript
{
  "type": "field",
  "inboundTag": ["tg-in"],
  "outboundTag": "tg-out"
}
```

The configure your Telegram app to connect to 443 port on this machine.