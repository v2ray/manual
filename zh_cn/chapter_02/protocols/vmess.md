---
refcn: chapter_02/protocols/vmess
refen: configuration/protocols/vmess
---

# VMess

* 名称：`vmess`
* 类型：入站 / 出站

[VMess](../../developer/protocols/vmess.md) 是一个加密传输协议，它分为入站和出站两部分，通常作为 V2Ray 客户端和服务器之间的桥梁。

VMess 依赖于系统时间，请确保使用 V2Ray 的系统 UTC 时间误差在 90 秒之内，时区无关。在 Linux 系统中可以安装`ntp`服务来自动同步系统时间。

VMess 的配置分为两部分，`InboundConfigurationObject`和`OutboundConfigurationObject`，分别对应入站和出站协议配置中的`settings`项。

## OutboundConfigurationObject

```javascript
{
  "vnext": [
    {
      "address": "127.0.0.1",
      "port": 37192,
      "users": [
        {
          "id": "27848739-7e62-4138-9fd3-098a63964b6b",
          "alterId": 4,
          "security": "auto",
          "level": 0
        }
      ]
    }
  ]
}
```

> `vnext`：\[ [ServerObject](#serverobject) \]

一个数组，包含一系列的服务器配置

### ServerObject

```javascript
{
  "address": "127.0.0.1",
  "port": 37192,
  "users": []
}
```

> `address`: address

服务器地址，支持 IP 地址或者域名。

> `port`: number

服务器端口号。

> `users`: \[ [UserObject](#userobject) \]

一组服务器认可的用户

### UserObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "alterId": 4,
  "security": "auto",
  "level": 0
}
```

> `id`：string

VMess 用户的主 ID。必须是一个合法的 UUID。

> `alterId`：number

为了进一步防止被探测，一个用户可以在主 ID 的基础上，再额外生成多个 ID。这里只需要指定额外的 ID 的数量，推荐值为 4。不指定的话，默认值是 `0`。最大值 `65535`。这个值不能超过服务器端所指定的值。

> `level`: number

用户等级

> `security`: "aes-128-gcm" | "chacha20-poly1305" | "auto" | "none"

加密方式，客户端将使用配置的加密方式发送数据，服务器端自动识别，无需配置。

* `"aes-128-gcm"`：推荐在 PC 上使用
* `"chacha20-poly1305"`：推荐在手机端使用
* `"auto"`：默认值，自动选择（运行框架为 AMD64、ARM64 或 s390x 时为aes-128-gcm加密方式，其他情况则为 Chacha20-Poly1305 加密方式）
* `"none"`：不加密

{% hint style='info' %}
推荐使用`"auto"`加密方式，这样可以永久保证安全性和兼容性。
{% endhint %}

## InboundConfigurationObject

```javascript
{
  "clients": [
    {
      "id": "27848739-7e62-4138-9fd3-098a63964b6b",
      "level": 0,
      "alterId": 4,
      "email": "love@v2ray.com"
    }
  ],
  "default": {
    "level": 0,
    "alterId": 4
  },
  "detour": {
    "to": "tag_to_detour"
  },
  "disableInsecureEncryption": false
}
```

> `clients`: \[ [ClientObject](#clientobject) \]

一组服务器认可的用户。clients 可以为空。当此配置用作动态端口时，V2Ray 会自动创建用户。

> `detour`: [DetourObject](#detourobject)

指示对应的出站协议使用另一个服务器。

> `default`: [DefaultObject](#defaultobject)

可选，clients 的默认配置。仅在配合`detour`时有效。

> `disableInsecureEncryption`: true | false

是否禁止客户端使用不安全的加密方式，当客户端指定下列加密方式时，服务器会主动断开连接。默认值为`false`。

* `"none"`
* `"aes-128-cfb"`

### ClientObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "level": 0,
  "alterId": 4,
  "email": "love@v2ray.com"
}
```

> `id`: string

VMess 的用户 ID。必须是一个合法的 UUID。

> `level`: number

用户等级，详见[本地策略](../policy.md)

> `alterId`: number

与上文出站协议中的含义相同。

> `email`: string

用户邮箱地址，用于区分不同用户的流量。

{% hint style='info' %}
`alterId` 取值的大小和流量特征没有必然联系。对于日常使用，`16` 以内的值已经够用了。
{% endhint %}

### DetourObject

```javascript
{
  "to": "tag_to_detour"
}
```

> `to`: string

一个入站协议的`tag`，详见[配置文件](../02_protocols.md)。指定的入站协议必须是一个 VMess

### DefaultObject

```javascript
{
  "level": 0,
  "alterId": 4
}
```

> `level`: number

用户等级，意义同上。默认值为`0`。

> `alterId`: number

和`ClientObject`中的`alterId`相同，默认值为`64`。推荐值`4`。
