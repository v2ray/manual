---
refcn: chapter_02/transport/tcp
refen: configuration/transport/tcp
---
# TCP 전송

## TcpObject

```javascript
{
  "header": {
    "type": "none"
  }
}
```

> `header`: NoneHeaderObject | HttpHeaderobject

Header obfuscation. Default value is `NoneHeaderObject`.

### NoneHeaderObject

No header obfuscation.

```javascript
{
  "type": "none"
}
```

> `type`: "none"

Disable header obfuscation.

### HttpHeaderObject

HTTP header obfuscation. The configuration must be the same between connecting inbound and outbound.

```javascript
{
  "type": "http",
  "request": {},
  "response": {}
}
```

> `type`: "http"

Enable HTTP header obfuscation.

> `request`: [HTTPRequestObject](#httprequestobject)

HTTP request template.

> `response`: [HTTPResponseObject](#httpresponseobject)

HTTP response template.

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

HTTP version. Default value is `"1.1"`.

> `method`: string

HTTP method. Default value is `"GET"`。

> `path`: \[ string \]

HTTP path. An array is string. The path will be chosen randomly for every connection.

> `headers`: map{string, \[ string \] }

HTTP header. The key of each entry is the key of HTTP header. The value of each entry is a list of strings. The actual HTTP header value will be chosen randomly from the list for each connection. Default value is the values in the example above.

In a connection, all keys in the specified map will be set to the HTTP header.

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

HTTP version. Default value is `"1.1"`.

> `status`: string

HTTP status. Default value is `"200"`

> `reason`: string

HTTP status message. Default value is `"OK"`.

> `headers`: map{string, string}

HTTP header. The key of each entry is the key of HTTP header. The value of each entry is a list of strings. The actual HTTP header value will be chosen randomly from the list for each connection. Default value is the values in the example above.

In a connection, all keys in the specified map will be set to the HTTP header.