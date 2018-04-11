# Local Policy

Local policy is added in V2Ray 3.1.

本地策略可以配置一些用户相关的权限，比如连接超时设置。V2Ray 处理的每一个连接，都对应到一个用户，按照这个用户的等级（level）应用不同的策略。本地策略可按照等级的不同而变化。

示例配置：

```javascript
{
    "levels": {
        "0": {
            "handshake": 4,
            "connIdle": 300,
            "uplinkOnly": 5,
            "downlinkOnly": 30,
            "statsUserUplink": false,
            "statsUserDownlink": false
        }
    },
    "system": {
        "statsInboundUplink": false,
        "statsInboundDownlink": false
    }
}
```

其中：

* `level`: 一组键值对，每个键是一个字符串形式的数字（JSON 的要求），比如 `"0"`、`"1"` 等，双引号不能省略，这个数字对应用户等级。每一个值如下：
  * `handshake`: 连接建立时的握手时间限制。单位为秒。
  * `connIdle`: 连接空闲的时间限制。单位为秒。
  * `uplinkOnly`: 当连接下行线路关闭后的时间限制。单位为秒。
  * `downlinkOnly`: 当连接上行线路关闭后的时间限制。单位为秒。
  * `statsUserUplink`: 当值为`true`时，开启当前等级的所有用户的上行流量统计。
  * `statsUserDownlink`: 当值为`true`时，开启当前等级的所有用户的下行流量统计。
* `system` (V2Ray 3.18+): V2Ray 系统的策略。
  * `statsInboundUplink` (V2Ray 3.18+): 当值为`true`时，开启所有传入代理的上行流量统计。
  * `statsInboundDownlink` (V2Ray 3.18+): 当值为`true`时，开启所有传入代理的下行流量统计。

本地策略在连接处理时的具体细节：

1. 在传入代理处理一个新连接时，在握手阶段（比如 VMess 读取头部数据，判断目标服务器地址），如果使用的时间超过 `handshake` 时间，则中断该连接。
1. 在传入传出代理处理一个连接时，如果在 `connIdle` 时间内，没有任何数据被传输（包括上行和下行数据），则中断该连接。
1. 当客户端（如浏览器）关闭上行连接时，传入代理会在等待 `downlinkOnly` 时间后中断连接。
1. 当服务器（如远端网站）关闭下行连接时，传出代理会在等待 `uplinkOnly` 时间后中断连接。

每个传入传出代理现在都可以设置用户等级，V2Ray 会根据实际的用户等级应用不同的本地策略。