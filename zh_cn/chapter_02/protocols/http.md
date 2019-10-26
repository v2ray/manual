---
refcn: chapter_02/protocols/http
refen: configuration/protocols/http
---

# HTTP

* 名称：`http`
* 类型：入站 / 出站

HTTP 的配置分为两部分，`InboundConfigurationObject`和`OutboundConfigurationObject`，分别对应入站和出站协议配置中的`settings`项。

## InboundConfigurationObject

```javascript
{
  "timeout": 0,
  "accounts": [
    {
      "user": "my-username",
      "pass": "my-password"
    }
  ],
  "allowTransparent": false,
  "userLevel": 0
}
```

> `timeout`: number

从客户端读取数据的超时设置（秒），0 表示不限时。默认值为 300。 V2Ray 3.1 后等价于对应用户等级的 `connIdle` 策略。

> `accounts`: \[[AccountObject](#accountobject)\]

一个数组，数组中每个元素为一个用户帐号。默认值为空。

当 `accounts` 非空时，HTTP 代理将对入站连接进行 Basic Authentication 验证。

> `allowTransparent`: true | false

当为`true`时，会转发所有 HTTP 请求，而非只是代理请求。若配置不当，开启此选项会导致死循环。

> `userLevel`: number

用户等级，所有连接使用这一等级。

### AccountObject

```javascript
{
  "user": "my-username",
  "pass": "my-password"
}
```

> `user`: string

用户名，字符串类型。必填。

> `pass`: string

密码，字符串类型。必填。

{% hint style='info' %}
在 Linux 中使用以下环境变量即可在当前 session 使用全局 HTTP 代理（很多软件都支持这一设置，也有不支持的）。

* `export http_proxy=http://127.0.0.1:8080/` (地址须改成你配置的 HTTP 入站代理地址)
* `export https_proxy=$http_proxy`

## OutboundConfigurationObject


```javascript
{
  "servers": [
    {
      "address": "192.168.108.1",
      "port": 3128,
      "user": [
        {
          "user": "my-username",
          "pass": "my-password"
        }
      ]
    }
  ]
}
```

(V2ray 4.21.0+)

应该注意，虽然http outbound可以作为对外访问的配置，但http proxy协议没有对传输加密，不适宜经公网中传输，且因不支持udp传输将会导致core功能受限（Routing过程的的DNS查询不可用）。http outbound 更有意义的用法是在特殊情况下，只能使用http proxy对外访问内部网络中，作为为其他协议连接代理服务器的前置代理使用（见`OutboundObject`的`ProxySettingsObject`）。

(V2ray 4.21.1+)

4.20.0版本中引入了http outbound作为其他协议的前置代理用法中，缺乏了对tls配置的检测和处理（因当出站代理生效时，该出站协议的`streamSettings`完全不起作用），导致所有使用了tls的协议无法通过http proxy。4.21.1的补丁版本中对`streamSettings`中的`security`和`tlsSettings`保留生效。

> `servers`: 数组

HTTP代理服务器配置，若配置多个，循环使用 (RoundRobin)

> `address`: string

HTTP代理服务器地址，必填。

> `port`: int

HTTP代理服务器端口，必填。

> `user`: \[[AccountObject](#accountobject)\]

一个数组，数组中每个元素为一个用户帐号。默认值为空。

{% endhint %}
