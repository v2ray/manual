# VMess

[VMess](../../chapter_04/03_vmess.md) 是一个加密传输协议，它分为传入和传出两部分，通常作为 V2Ray 客户端和服务器之间的桥梁。

* 名称：vmess
* 类型：Inbound / Outbound

## VMess 传出协议配置

```javascript
{
  "vnext": [
    {
      "address": "127.0.0.1",
      "port": 37192,
      "users": [
        {
          "id": "27848739-7e62-4138-9fd3-098a63964b6b",
          "alterId": 10,
          "security": "aes-128-cfb"
        }
      ]
    }
  ]
}
```

其中：

* `vnext`：一个数组，包含一系列的服务器配置，其中每一个服务器：
  * `address`：服务器地址，支持 IP 地址或者域名。
  * `port`：服务器端口号。
  * `users`：一组服务器认可的用户，其中每一个用户：
    * `id`：VMess 用户的主 ID。
    * `alterId`：为了进一步防止被探测，一个用户可以在主 ID 的基础上，再额外生成多个 ID。这里只需要指定额外的 ID 的数量，推荐值为 100。不指定的话，默认值是 `0`。最大值 `65535`。这个值必须和服务器端所指定的值相同。
    * `security`(V2Ray 2.10+)：加密方式，可选的值有：
      * `"aes-128-cfb"`：默认值
      * `"aes-128-gcm"`：推荐在 PC 上使用
      * `"chacha20-poly1305"`：推荐在手机端使用
      * `"none"`: 不加密


## VMess 传入协议配置：

```javascript
{
  "clients": [
    {
      "id": "27848739-7e62-4138-9fd3-098a63964b6b",
      "level": 0,
      "alterId": 100,
      "email": "love@v2ray.com"
    }
  ],
  "default": {
    "level": 0,
    "alterId": 32
  },
  "detour": {
    "to": "tag_to_detour"
  }
}
```

其中：

* `clients`：一组服务器认可的用户。clients 可以为空。当此配置用作动态端口时，V2Ray 会自动创建用户。
  * 其中每一个用户：
    * `id`：VMess 的用户 ID。
    * `level`：用户等级
      * 当 `level` 为 `0` 时，此用户不被信任，V2Ray 将对此用户进行严格的安全限制；
      * 当 `level` 大于 `0` 时，此用户被信任，V2Ray 将放宽对此用户的限制。
    * `alterId`: 同 Inbound。
    * `email`: 用户邮箱地址，用于区分不同用户的流量。
* `detour`: 转向 outboundDetour
  * `to`: 一个 outboundDetour 的 tag，详见[配置文件](../02_protocols.md)
* `default`: 可选，clients 的默认配置
  * `level`: 用户等级，意义同上。默认值为`0`。
  * `alterId`: 同 Inbound，默认值为`64`。
