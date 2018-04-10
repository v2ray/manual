# API

![English](../resources/englishc.svg) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/api.html)

V2Ray 中可以开放一些 API 以便远程调用。这些 API 都基于 [gRPC](https://grpc.io/)。

当远程控制开启时，V2Ray 会自建一个传出代理，以`tag`配置的值为标识。用户必须手动将所有的 gRPC 传入连接通过[路由](03_routing.md)指向这一传出代理。

配置如下：

```javascript
{
    "tag": "api",
    "services": [
        "HandlerService",
        "LoggerService",
        "StatsService"
    ]
}
```

其中：

* `tag`: 传出代理标识。
* `services`: 开启的 API 列表。

## Supported API list

### HandlerService

一些对于传入传出代理进行修改的 API，可用的功能如下：

* 添加一个新的传入代理；
* 添加一个新的传出代理；
* 删除一个现有的传入代理；
* 删除一个现有的传出代理；
* 在一个传入代理中添加一个用户（仅支持 VMess）；
* 在一个传入代理中删除一个用户（仅支持 VMess）；

### LoggerService

To restart internal logger. Can work with logrotate for operating log files.

### StatsService

Internal [Statistics](stats.md).
