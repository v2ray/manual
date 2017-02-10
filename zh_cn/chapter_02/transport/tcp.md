# TCP 传输方式

配置：

```javascript
{
  "connectionReuse": true,
  "header": {
    "type": "none"
  }
}
```

其中：

* `connectionReuse`: 是否重用 TCP 连接，默认值为 `true`。
  * 目前只对 VMess 起作用；
  * 当值为 `true` 时，V2Ray 会在传输完一段数据之后，继续使用同一个 TCP 连接来传输下一段数据。
* `header`: 数据包头部伪装设置：
  * `type`: 伪装类型，可选的值有：
    * `"none"`: 默认值，不进行伪装；
    * `"http"`: 伪装成 HTTP 数据流，具体配置见下。

## HTTP 伪装配置

HTTP 伪装配置必须在对应的传入传出连接上同时配置，且内容必须一致。

```javascript
{
  "type": "http",
  "request": {
    "version": "1.1",
    "method": "GET",
    "path": ["/"],
    "headers": {
      "Host": ["www.baidu.com", "www.bing.com"],
      "User-Agent": [
        "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_0_2 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/53.0.2785.109 Mobile/14A456 Safari/601.1.46"
      ],
      "Accept-Encoding": ["gzip, deflate"],
      "Connection": ["keep-alive"],
      "Pragma": "no-cache"
    }
  },
  "response": {
    "version": "1.1",
    "status": "200",
    "reason": "OK",
    "headers": {
      "Content-Type": ["application/octet-stream", "video/mpeg"],
      "Transfer-Encoding": ["chunked"],
      "Connection": ["keep-alive"],
      "Pragma": "no-cache"
    }
  }
}
```

其中：

* `type`: 和 `tcpSettings` 中的 `type` 是同一项。
* `request`: HTTP 请求
  * `version`: HTTP 版本，默认值为`"1.1"`。
  * `method`: HTTP 方法，默认值为`"GET"`。
  * `path`: 路径，一个字符串数组。默认值为`"/"`。当有多个值时，每次请求随机选择一个值。
  * `headers`: HTTP 头，一个键值对，每个键表示一个 HTTP 头的名称，对应的值是一个数组。每次请求会附上所有的键，并随机选择一个对应的值。默认值见样例。
* `response`: HTTP 响应
  * `version`: HTTP 版本，默认值为`"1.1"`。
  * `status`: HTTP 状态，默认值为`"200"`。
  * `reason`: HTTP 状态说明，默认值为`"OK"`。
  * `headers`: HTTP 头，一个键值对，每个键表示一个 HTTP 头的名称，对应的值是一个数组。每次请求会附上所有的键，并随机选择一个对应的值。默认值见样例。
