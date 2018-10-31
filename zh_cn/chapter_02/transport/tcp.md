---
refcn: chapter_02/transport/tcp
refen: configuration/transport/tcp
---

# TCP 传输方式

## TcpObject

```javascript
{
  "header": {
    "type": "none"
  }
}
```

> `header`: NoneHeaderObject | HttpHeaderobject

数据包头部伪装设置，默认值为`NoneHeaderObject`。

### NoneHeaderObject

不进行伪装

```javascript
{
  "type": "none"
}
```

> `type`: "none"

指定不进行伪装

### HttpHeaderObject

HTTP 伪装配置必须在对应的入站出站连接上同时配置，且内容必须一致。

```javascript
{
  "type": "http",
  "request": {},
  "response": {}
}
```

> `type`: "http"

指定进行 HTTP 伪装

> `request`: [HTTPRequestObject](#httprequestobject)

HTTP 请求

> `response`: [HTTPResponseObject](#httpresponseobject)

HTTP 响应

### HTTPRequestObject

```javascript
{
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
}
```

> `version`: string

HTTP 版本，默认值为`"1.1"`。

> `method`: string

HTTP 方法，默认值为`"GET"`。

> `path`: \[ string \]

路径，一个字符串数组。默认值为`["/"]`。当有多个值时，每次请求随机选择一个值。

> `headers`: map{string, string}

HTTP 头，一个键值对，每个键表示一个 HTTP 头的名称，对应的值是一个数组。每次请求会附上所有的键，并随机选择一个对应的值。默认值见上方示例。

### HTTPResponseObject

```javascript
{
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
```

> `version`: string

HTTP 版本，默认值为`"1.1"`。

> `status`: string

HTTP 状态，默认值为`"200"`。

> `reason`: string

HTTP 状态说明，默认值为`"OK"`。

> `headers`: map{string, string}

HTTP 头，一个键值对，每个键表示一个 HTTP 头的名称，对应的值是一个数组。每次请求会附上所有的键，并随机选择一个对应的值。默认值见上方示例。
