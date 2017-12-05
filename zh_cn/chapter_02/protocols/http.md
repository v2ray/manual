# HTTP

HTTP 是一个传入数据协议，兼容 HTTP 1.x 代理。

* 名称：http
* 类型：Inbound
* 配置：

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

其中：

* `timeout` (V2Ray 3.1 后等价于对应用户等级的 `connIdle` 策略): 从客户端读取数据的超时设置（秒），0 表示不限时。默认值为 300。
* `accounts`: 一个数组，数组中每个元素为一个用户帐号，用户名由`user`指定，密码由`pass`指定。默认值为空。
  * 当 `accounts` 非空时，HTTP 代理将对传入连接进行 Basic Authentication 验证。
* `allowTransparent`: 当为`true`时，会转发所有 HTTP 请求，而非只是代理请求。若配置不当，开启此选项会导致死循环。
* `userLevel`: 用户等级，所有连接使用这一等级。

## 小贴士

在 Linux 中使用以下环境变量即可在当前 session 使用全局 HTTP 代理（很多软件都支持这一设置，也有不支持的）。

* `export http_proxy=http://127.0.0.1:8080/` (地址须改成你配置的 HTTP 传入代理地址)
* `export https_proxy=$http_proxy`
