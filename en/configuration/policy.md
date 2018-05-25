# Local Policy

Local policy is added in V2Ray 3.1.

Local policy manages settings of current V2Ray instance, such as connection timeouts. The policys can be applied to each user level, or the whole system.

Configuration:

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

Where:

* `level`: A list of key value pairs. Each key is a string of integer (restricted by JSON), such as `"0"`, `"1"`, etc. The numeric value is for a certain user level. Each value has the following attributes:
  * `handshake`: Timeout for establishing a connection, in seconds. Default value `4`.
  * `connIdle`: Timeout for idle connections, in seconds. Default value `300`.
  * `uplinkOnly`: Time for keeping connections open after the uplink of the connection is closed, in seconds. Default value `2`.
  * `downlinkOnly`: Time for keeping connections open after the downlink of the connection is closed, in seconds. Default value `5`.
  * `statsUserUplink`: When set to `true`, V2Ray enables stat counter to uplink traffic for all users in this level.
  * `statsUserDownlink`: When set to `true`, V2Ray enables stat counter to downlink traffic for all users in this level.
  * `bufferSize` (V2Ray 3.24+): Size of internal buffer per connection, in kilo-bytes. Default value is `10240`. When it is set to `0`, the internal buffer is disabled.
* `system` (V2Ray 3.18+): System policy for V2Ray
  * `statsInboundUplink` (V2Ray 3.18+): When set to `true`, V2Ray enables stat counter for all uplink traffic in all inbound proxies.
  * `statsInboundDownlink` (V2Ray 3.18+): When set to `true`, V2Ray enables stat counter for all downlink traffic in all inbound proxies.

Some details when V2Ray handles connections:

1. At the handshake stage of an inbound proxy dealing with a new connection, say VMess reading request header, if it takes longer than `handshake` time, V2Ray aborts the connection.
1. If there is no data passed through the connection in `connIdle` time, V2Ray aborts the conneciton.
1. After client (browser) closes the uplink of the connection, V2Ray aborts the connection after `downlinkOnly` time.
1. After remote (server) closes the downlink of the connection, V2Ray aborts the connection after `uplinkOnly` times.

## Tips

* Each inbound and outbound connection can apply a user level. V2Ray applies corresponding policy based on user level.
* `bufferSize` overrides `v2ray.ray.buffer.size` settings in [env variables](env.md#cache-size-per-connection).
