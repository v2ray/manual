---
refcn: chapter_02/protocols/mtproto
refen: configuration/protocols/mtproto
---
# MTProto

* Name: `mtproto`
* Type: Inbound / Outbound

MTProto proxy is a special procol for Telegram. It consists of a pair of inbound and outboud proxies in V2Ray. They are usually used together for building a proxy for Telegram

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

## Outbound configuration {#outbound}

```javascript
{
}
```

## Sample {#sample}

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