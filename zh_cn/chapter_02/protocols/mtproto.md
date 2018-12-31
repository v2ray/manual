---
refcn: chapter_02/protocols/mtproto
refen: configuration/protocols/mtproto
---

# MTProto

* 名称: `mtproto`
* 类型: 入站 / 出站

MTProto 是一个 Telegram 专用的代理协议。在 V2Ray 中可使用一组入站出站代理来完成 Telegram 数据的代理任务。

目前只支持转发到 Telegram 的 IPv4 地址。

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

一个数组，其中每一个元素表示一个用户。目前只有第一个用户会生效。

### UserObject

```javascript
{
  "email": "love@v2ray.com",
  "level": 0,
  "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
}
```

> `email`: string

用户邮箱，用于统计流量等辅助功能

> `level`: number

用户等级。

> `secret`: string

用户密钥。必须为 32 个字符，仅可包含`0`到`9`和`a`到`f`之间的字符。

{% hint style='info' %}
使用此命令生成 MTProto 代理所需要的用户密钥：`openssl rand -hex 16`
{% endhint %}

## OutboundConfigurationObject

```javascript
{
}
```

## 样例配置 {#sample}

MTProto 仅可用于 Telegram 数据。你可能需要一个路由来绑定对应的入站出站代理。以下是一个不完整的示例：

入站代理：

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

出站代理：

```javascript
{
  "tag": "tg-out",
  "protocol": "mtproto",
  "settings": {}
}
```

路由：

```javascript
{
  "type": "field",
  "inboundTag": ["tg-in"],
  "outboundTag": "tg-out"
}
```

然后使用 Telegram 连接这台机器的 443 端口即可。
