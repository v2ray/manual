---
refcn: chapter_02/protocols/vmess
refen: configuration/protocols/vmess
---

# VMess

[VMess](../../developer/protocols/vmess.md) 是一个加密传输协议，它分为传入和传出两部分，通常作为 V2Ray 客户端和服务器之间的桥梁。

* 名称：vmess
* 类型：Inbound / Outbound

## 传出协议配置 {#outbound}

```javascript
{
  "vnext": [
    {
      "address": "127.0.0.1",
      "port": 37192,
      "users": [
        {
          "id": "27848739-7e62-4138-9fd3-098a63964b6b",
          "alterId": 16,
          "security": "auto",
          "level": 0
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
    * `alterId`：为了进一步防止被探测，一个用户可以在主 ID 的基础上，再额外生成多个 ID。这里只需要指定额外的 ID 的数量，推荐值为 16。不指定的话，默认值是 `0`。最大值 `65535`。这个值不能超过服务器端所指定的值。
    * `level`: 用户等级
    * `security`：加密方式，客户端将使用配置的加密方式发送数据，服务器端自动识别，无需配置。可选的值有：
      * `"aes-128-gcm"`：推荐在 PC 上使用
      * `"chacha20-poly1305"`：推荐在手机端使用
      * `"auto"`：默认值，自动选择（运行框架为 AMD64、ARM64 或 s390x 时为aes-128-gcm加密方式，其他情况则为 Chacha20-Poly1305 加密方式）
      * `"none"`：不加密

## 传入协议配置 {#inbound}

```javascript
{
  "clients": [
    {
      "id": "27848739-7e62-4138-9fd3-098a63964b6b",
      "level": 0,
      "alterId": 16,
      "email": "love@v2ray.com"
    }
  ],
  "default": {
    "level": 0,
    "alterId": 32
  },
  "detour": {
    "to": "tag_to_detour"
  },
  "disableInsecureEncryption": false
}
```

其中：

* `clients`：一组服务器认可的用户。clients 可以为空。当此配置用作动态端口时，V2Ray 会自动创建用户。
  * 其中每一个用户：
    * `id`：VMess 的用户 ID。
    * `level`：用户等级，详见[本地策略](../policy.md)
    * `alterId`: 与上文传出协议中的含义相同。
    * `email`: 用户邮箱地址，用于区分不同用户的流量。
* `detour`: 转向 inboundDetour
  * `to`: 一个 inboundDetour 的 tag，详见[配置文件](../02_protocols.md)
* `default`: 可选，clients 的默认配置
  * `level`: 用户等级，意义同上。默认值为`0`。
  * `alterId`: 同 Inbound，默认值为`64`。推荐值`16`。
* `disableInsecureEncryption`: 禁止客户端使用不安全的加密方式，当客户端指定下列加密方式时，服务器会主动断开连接。默认值为`false`。
  * `none`
  * `aes-128-cfb`

## 小贴士 {#tip}

* 推荐在客户端使用`"auto"`加密方式，这样可以永久保证安全性和兼容性。
* VMess 依赖于系统时间，请确保使用 V2Ray 的系统 UTC 时间误差在两分钟之内，时区无关。
  * 在 Linux 系统中可以安装`ntp`服务来自动同步系统时间。
* `alterId` 取值的大小和流量特征没有必然联系。对于日常使用，`100` 以内的值已经够用了。
