---
refcn: chapter_02/protocols/mtproto
refen: configuration/protocols/mtproto
---
# MTProto

MTProto proxy is a special procol for Telegram. It consists of a pair of inbound and outboud proxies in V2Ray. They are usually used together for building a proxy for Telegram

**For now V2Ray only supports IPv4 address of Telegram server.**

Protocol description:

* Name: mtproto
* Geben Sie ein: Eingehend / Ausgehend

## Inbound configuration {#inbound}

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

* `users`: An array of users. **For now only the first user is effective**. Each user has the following configuration: 
  * `email`: User email. Used for tracking purposes. See [Stats](../stats.md).
  * `Stufe`: Benutzerebene.
  * `secret`: User secret. In Telegram, user secret must be 32 characters long, and only contains characters between `0` to `9`, and `a`to `f`.

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

## Tips {#tips}

* Use this command to generate MTProto secret: `openssl rand -hex 16`.