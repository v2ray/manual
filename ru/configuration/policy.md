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

Где:

* `level`: Ассоциативный массив, пары ключ-значение. Каждый ключ — строка с целым числом (это ограничения JSON), типа `"0"`, `"1"`и т.д. Числовое значение — это пользовательский уровень. Каждое значение имеет следующие атрибуты: 
  * `handshake`: Таймаут на установление соединения, в секундах. По умолчанию `4`.
  * `connIdle`: Таймаут для простаивающих соединений, в секундах. По умолчанию `300`.
  * `uplinkOnly`: Время поддержания соединения после закрытия исходящего соединения, в секундах. По умолчанию `2`.
  * `downlinkOnly`: Время поддержания соединения после закрытия исходящего соединения, в секундах. По умолчанию `5`.
  * `statsUserUplink`: When set to `true`, V2Ray enables stat counter to uplink traffic for all users in this level.
  * `statsUserDownlink`: When set to `true`, V2Ray enables stat counter to downlink traffic for all users in this level.
  * `bufferSize` (V2Ray 3.24+): Size of internal buffer per connection, in kilo-bytes. Default value is `10240`. When it is set to `0`, the internal buffer is disabled.
* `system` (V2Ray 3.18+): System policy for V2Ray 
  * `statsInboundUplink` (V2Ray 3.18+): When set to `true`, V2Ray enables stat counter for all uplink traffic in all inbound proxies.
  * `statsInboundDownlink` (V2Ray 3.18+): When set to `true`, V2Ray enables stat counter for all downlink traffic in all inbound proxies.

Some details when V2Ray handles connections:

1. At the handshake stage of an inbound proxy dealing with a new connection, say VMess reading request header, if it takes longer than `handshake` time, V2Ray aborts the connection.
2. If there is no data passed through the connection in `connIdle` time, V2Ray aborts the conneciton.
3. After client (browser) closes the uplink of the connection, V2Ray aborts the connection after `downlinkOnly` time.
4. After remote (server) closes the downlink of the connection, V2Ray aborts the connection after `uplinkOnly` times.

## Tips {#tips}

* Each inbound and outbound connection can apply a user level. V2Ray applies corresponding policy based on user level.
* `bufferSize` overrides `v2ray.ray.buffer.size` settings in [env variables](env.md#cache-size-per-connection).