* * *

refcn: chapter_02/policy refen: configuration/policy

* * *

# Lokale Richtlinie

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

* `Niveau`: Eine Liste von Schlüsselwertpaaren. Jeder Schlüssel ist eine Ganzzahl (eingeschränkt durch JSON) wie `"0"`, `"1"`usw. Der numerische Wert gilt für eine bestimmte Benutzerebene. Jeder Wert hat die folgenden Attribute: 
  * `Handshake`: Timeout für den Verbindungsaufbau in Sekunden. Standardwert `4`.
  * `CONNIdle`: Timeout für inaktive Verbindungen in Sekunden. Standardwert `300`.
  * `uplinkOnly`: Zeit für das Offenhalten von Verbindungen nach dem Schließen der Verbindung in Sekunden. Standardwert `2`.
  * `downlinkOnly`: Zeit für das Offenhalten von Verbindungen nach dem Schließen der Verbindung in Sekunden. Standardwert `5`.
  * `statsUserUplink`: Wenn `True`, aktiviert V2Ray den Statuszähler für den Uplink-Verkehr für alle Benutzer in dieser Ebene.
  * `statsUserDownlink`: Wenn `wahr`, aktiviert V2Ray den Statuszähler für den Downlink-Verkehr für alle Benutzer in dieser Ebene.
  * `bufferSize` (V2Ray 3.24+): Größe des internen Puffers pro Verbindung in Kilobyte. Standardwert ist `10240`. Wenn es auf `0`, ist der interne Puffer deaktiviert.
* `System` (V2Ray 3.18+): Systemrichtlinie für V2Ray 
  * `statsInboundUplink` (V2Ray 3.18+): Wenn `wahr`, aktiviert V2Ray den Statistikzähler für den gesamten Aufwärtsverkehr in allen eingehenden Proxys.
  * `statsInboundDownlink` (V2Ray 3.18+): Wenn `True`, aktiviert V2Ray den Statistikzähler für den gesamten Downlink-Verkehr in allen eingehenden Proxys.

Some details when V2Ray handles connections:

1. An der Handshake Phase eines eingehenden Proxy mit einer neuen Verbindung zu tun, sagen VMess Request - Header zu lesen, wenn es länger als dauert `Handshake` Mal, V2Ray die Verbindung abbricht.
2. Wenn in `connIdle` keine Daten über die Verbindung übergeben werden, bricht V2Ray die Verbindung ab.
3. Nachdem der Client (Browser) den Uplink der Verbindung beendet hat, bricht V2Ray die Verbindung nach `downlinkOnly` time ab.
4. Nachdem Remote (Server) den Downlink der Verbindung beendet hat, bricht V2Ray die Verbindung nach `UplinkOnly` mal ab.

## Tips {#tips}

* Jede eingehende und ausgehende Verbindung kann eine Benutzerebene anwenden. V2Ray wendet entsprechende Richtlinien auf Benutzerebene an.
* `bufferSize` überschreibt `v2ray.ray.buffer.size` Einstellungen in [env-Variablen](env.md#cache-size-per-connection).