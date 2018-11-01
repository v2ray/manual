---
refcn: chapter_02/policy
refen: configuration/policy
---
# Lokale Richtlinie

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

Wo:

* `Niveau`: A list of key value pairs. Each key is a string of integer (restricted by JSON), such as `"0"`, `"1"`, etc. The numeric value is for a certain user level. Each value has the following attributes: 
  * `handshake`: Timeout for establishing a connection, in seconds. Default value `4`.
  * `connIdle`: Timeout for idle connections, in seconds. Default value `300`.
  * `uplinkOnly`: Time for keeping connections open after the uplink of the connection is closed, in seconds. Default value `2`.
  * `downlinkOnly`: Time for keeping connections open after the downlink of the connection is closed, in seconds. Default value `5`.
  * `statsUserUplink`: Wenn `True`, aktiviert V2Ray den Statuszähler für den Uplink-Verkehr für alle Benutzer in dieser Ebene.
  * `statsUserDownlink`: Wenn `wahr`, aktiviert V2Ray den Statuszähler für den Downlink-Verkehr für alle Benutzer in dieser Ebene.
  * `bufferSize` (V2Ray 3.24+): Size of internal buffer per connection, in kilo-bytes. Default value is `10240`. When it is set to `0`, the internal buffer is disabled.
* `System` (V2Ray 3.18+): Systemrichtlinie für V2Ray 
  * `statsInboundUplink` (V2Ray 3.18+): Wenn `wahr`, aktiviert V2Ray den Statistikzähler für den gesamten Aufwärtsverkehr in allen eingehenden Proxys.
  * `statsInboundDownlink` (V2Ray 3.18+): Wenn `True`, aktiviert V2Ray den Statistikzähler für den gesamten Downlink-Verkehr in allen eingehenden Proxys.

Some details when V2Ray handles connections:

1. An der Handshake Phase eines eingehenden Proxy mit einer neuen Verbindung zu tun, sagen VMess Request - Header zu lesen, wenn es länger als dauert `Handshake` Mal, V2Ray die Verbindung abbricht.
2. Wenn in `connIdle` keine Daten über die Verbindung übergeben werden, bricht V2Ray die Verbindung ab.
3. Nachdem der Client (Browser) den Uplink der Verbindung beendet hat, bricht V2Ray die Verbindung nach `downlinkOnly` time ab.
4. Nachdem Remote (Server) den Downlink der Verbindung beendet hat, bricht V2Ray die Verbindung nach `UplinkOnly` mal ab.

## Tips {#tips}

* Each inbound and outbound connection can apply a user level. V2Ray applies corresponding policy based on user level.
* `bufferSize` überschreibt `v2ray.ray.buffer.size` Einstellungen in [env-Variablen](env.md#cache-size-per-connection).