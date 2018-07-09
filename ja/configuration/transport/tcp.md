# TCP Transport

[![English](../../resources/english.svg)](https://www.v2ray.com/en/configuration/transport/tcp.html) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/transport/tcp.html) [![German](../../resources/german.svg)](https://www.v2ray.com/de/configuration/transport/tcp.html) [![Russian](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/transport/tcp.html)

Configuration:

```javascript
{
  "header": {
    "type": "none"
  }
}
```

Where:

* `header`: Header obfuscation settings: 
  * `type`: Type of obfuscation. Choices are: 
    * `"none"`: Default. No obfuscation at all.
    * `"http"`: HTTP obfuscation. See below.

## HTTP obfuscation

HTTP obfuscation must be configured (and matching) for the inbound and outbound of the connecting peers.

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

Where:

* `type`: same `type` entry as in `tcpSettings`.
* `request`: HTTP request settings: 
  * `version`: HTTP version, default value `"1.1"`
  * `method`: HTTP method, default value `"GET"`。
  * `path`: Path. A string array. Default value is `["/"]`. When there are multiple values, value is picked up randomly for each request.
  * `headers`: HTTP headers. It is a key value pair. Each key is key of the HTTP header, and value is the value of the HTTP header. When multiple values are set, the effetive value is picked up randomly for each request. Default settings is same as the example above.
* `response`: HTTP response. 
  * `version`: HTTP version. Default value is `"1.1"`.
  * `status`: HTTP status. Default value is `"200"`.
  * `reason`: HTTP status text. Default value is `"OK"`.
  * `headers`: HTTP header. Same as request headers, but for response.