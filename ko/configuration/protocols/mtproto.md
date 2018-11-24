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

> `명의 사용자`: \ [[UserObject](#userobject)\]

사용자 배열. 현재로서는 첫 번째 사용자 만 효과적입니다.

### UserObject

```javascript
{
  "email": "love@v2ray.com",
  "level": 0,
  "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
}
```

> `이메일`: 문자열

사용자 이메일. 추적 목적으로 사용됩니다. [통계보기](../stats.md).

> `레벨`: 숫자

사용자 수준.

> `비밀`: 문자열

사용자 비밀. 텔레 그램에서 사용자 비밀은 32 자이어야하며 `0` 에서 `9`사이의 문자와 `a`에서 `f`사이의 문자 만 포함해야합니다.

{% hint style='tip' %}

You may use the following command to generate MTProto secret: `openssl rand -hex 16`

{% endhint %}

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