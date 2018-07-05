# MTProto

MTProto 是一个 Telegram 专用的代理协议。在 V2Ray 中可使用一组传入传出代理来完成 Telegram 数据的代理任务。

## 传入协议配置 {#inbound}

```javascript
{
  "users": [{
    "email": "love@v2ray.com",
    "level": 0,
    "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
  }]
}
```

其中：

* `users`: 一个数组，其中每一个元素表示一个用户。**目前只有第一个用户会生效**。每个用户的配置如下：
  * `email`: 用户邮箱。
  * `level`: 用户等级。
  * `secret`: 用户密钥。必须为 32 个字符，仅可包含`0`到`9`和`a`到`f`之间的字符。

## 传出协议配置 {#outbound}

```javascript
{
}
```

## 小贴示 {#tips}

* MTProto 仅可用于 Telegram 数据。你可能需要一个路由来绑定对应的传入传出代理。
