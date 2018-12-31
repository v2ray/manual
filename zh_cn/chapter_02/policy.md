---
refcn: chapter_02/policy
refen: configuration/policy
---

# 本地策略

本地策略可以配置一些用户相关的权限，比如连接超时设置。V2Ray 处理的每一个连接，都对应到一个用户，按照这个用户的等级（level）应用不同的策略。本地策略可按照等级的不同而变化。

## PolicyObject

`PolicyObject`对应配置文件中的`policy`项。

```javascript
{
  "levels": {
    "0": {
      "handshake": 4,
      "connIdle": 300,
      "uplinkOnly": 2,
      "downlinkOnly": 5,
      "statsUserUplink": false,
      "statsUserDownlink": false,
      "bufferSize": 10240
    }
  },
  "system": {
    "statsInboundUplink": false,
    "statsInboundDownlink": false
  }
}
```

> `level`: map{string: [LevelPolicyObject](#levelpolicyobject)}

一组键值对，每个键是一个字符串形式的数字（JSON 的要求），比如 `"0"`、`"1"` 等，双引号不能省略，这个数字对应用户等级。每一个值是一个 [LevelPolicyObject](#levelpolicyobject).

{% hint style='info' %}
每个入站出站代理现在都可以设置用户等级，V2Ray 会根据实际的用户等级应用不同的本地策略。
{% endhint %}

> `system`: [SystemPolicyObject](#systempolicyobject)

V2Ray 系统的策略

### LevelPolicyObject

```javascript
{
  "handshake": 4,
  "connIdle": 300,
  "uplinkOnly": 2,
  "downlinkOnly": 5,
  "statsUserUplink": false,
  "statsUserDownlink": false,
  "bufferSize": 10240
}
```

> `handshake`: number

连接建立时的握手时间限制。单位为秒。默认值为`4`。在入站代理处理一个新连接时，在握手阶段（比如 VMess 读取头部数据，判断目标服务器地址），如果使用的时间超过这个时间，则中断该连接。

> `connIdle`: number

连接空闲的时间限制。单位为秒。默认值为`300`。在入站出站代理处理一个连接时，如果在 `connIdle` 时间内，没有任何数据被传输（包括上行和下行数据），则中断该连接。

> `uplinkOnly`: number

当连接下行线路关闭后的时间限制。单位为秒。默认值为`2`。当服务器（如远端网站）关闭下行连接时，出站代理会在等待 `uplinkOnly` 时间后中断连接。

> `downlinkOnly`: number

当连接上行线路关闭后的时间限制。单位为秒。默认值为`5`。当客户端（如浏览器）关闭上行连接时，入站代理会在等待 `downlinkOnly` 时间后中断连接。

{% hint style='tip' %}
在 HTTP 浏览的场景中，可以将`uplinkOnly`和`downlinkOnly`设为`0`，以提高连接关闭的效率。
{% endhint %}

> `statsUserUplink`: true | false

当值为`true`时，开启当前等级的所有用户的上行流量统计。

> `statsUserDownlink`: true | false

当值为`true`时，开启当前等级的所有用户的下行流量统计。

> `bufferSize`: number

每个连接的内部缓存大小。单位为 kB。当值为`0`时，内部缓存被禁用。

默认值 (V2Ray 4.4+):

* 在 ARM、MIPS、MIPSLE 平台上，默认值为`0`。
* 在 ARM64、MIPS64、MIPS64LE 平台上，默认值为`4`。
* 在其它平台上，默认值为`512`。

默认值 (V2Ray 4.3-):

* 在 ARM、MIPS、MIPSLE、ARM64、MIPS64、MIPS64LE 平台上，默认值为`16`。
* 在其它平台上，默认值为`2048`。

{% hint style='info' %}
`bufferSize` 选项会覆盖[环境变量](env.md#buffer-size)中`v2ray.ray.buffer.size`的设定。
{% endhint %}

### SystemPolicyObject

```javascript
{
  "statsInboundUplink": false,
  "statsInboundDownlink": false
}
```

> `statsInboundUplink`: true | false

当值为`true`时，开启所有入站代理的上行流量统计。

> `statsInboundDownlink`: true | false

当值为`true`时，开启所有入站代理的下行流量统计。
