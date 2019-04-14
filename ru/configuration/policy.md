---
refcn: chapter_02/policy
refen: configuration/policy
---
# Локальная политика

Local policy manages policy settings of current V2Ray instance, such as connection timeouts. The policys can be applied to each user level, or the whole system.

## PolicyObject

`PolicyObject` is used as `policy` field in top level configuration.

```javascript
{
  "levels": {
    "0": {
      "handshake": 4,
      "connIdle": 300,
      "uplinkOnly": 2,
      "downlinkOnly": 5,
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

> `level`: map{string: [LevelPolicyObject](#levelpolicyobject)}

A list of key value pairs. Each key is a string of integer (restricted by JSON), such as `"0"`, `"1"`, etc. The numeric value is for a certain user level.

{% hint style='info' %}

User level can be set on each inbound and outbound proxy. V2Ray will apply different policies based on user level.

{% endhint %}

> `system`: [SystemPolicyObject](#systempolicyobject)

System-wide policy

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

Timeout for establishing a connection, in seconds. Default value `4`. At the handshake stage of an inbound proxy dealing with a new connection, say VMess reading request header, if it takes longer than `handshake` time, V2Ray aborts the connection.

> `connIdle`: number

Timeout for idle connections, in seconds. Default value `300`. If there is no data passed through the connection in `connIdle` time, V2Ray aborts the conneciton.

> `uplinkOnly`: number

Time for keeping connections open after the uplink of the connection is closed, in seconds. Default value `2`. After remote (server) closes the downlink of the connection, V2Ray aborts the connection after `uplinkOnly` times.

> `downlinkOnly`: number

Time for keeping connections open after the downlink of the connection is closed, in seconds. Default value `5`. After client (browser) closes the uplink of the connection, V2Ray aborts the connection after `downlinkOnly` time.

{% hint style='tip' %}

In a simple webpage browser scenario, it is safe to set `uplinkOnly` and `downlinkOnly` both to `0`, for better performance.

{% endhint %}

> `statsUserUplink`: true | false

When set to `true`, V2Ray enables stat counter to uplink traffic for all users in this level.

> `statsUserDownlink`: true | false

When set to `true`, V2Ray enables stat counter to downlink traffic for all users in this level.

> `bufferSize`: number

Size of internal buffer per connection, in kilo-bytes. Default value is `10240`. When it is set to `0`, the internal buffer is disabled.

Default value (V2Ray 4.4+):

* `0` on ARM, MIPS and MIPSLE.
* `4` on ARM64, MIPS64 and MIPS64LE.
* `512` on other platforms.

Default value (V2Ray 4.3-):

* `16` on ARM, ARM64, MIPS, MIPS64, MIPSLE and MIPS64LE.
* `2048` on other platforms.

{% hint style='info' %}

`bufferSize` overrides `v2ray.ray.buffer.size` settings in [env variables](env.md#cache-size-per-connection).

{% endhint %}

### SystemPolicyObject

```javascript
{
  "statsInboundUplink": false,
  "statsInboundDownlink": false
}
```

> `statsInboundUplink`: true | false

When set to `true`, V2Ray enables stat counter for all uplink traffic in all inbound proxies.

> `statsInboundDownlink`: true | false

When set to `true`, V2Ray enables stat counter for all downlink traffic in all inbound proxies.