# Statistiken

![Englisch](../resources/englishc.svg) [![Chinesisch](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/stats.html)

V2Ray bietet einige Informationen über seine Interna.

Aufbau:

```javascript
{
}
```

Alle Statistikzähler sind unten aufgeführt:

* `Benutzer>>>[email]>>>Verkehr>>>Uplink` (V2Ray 3.16+): Akkumulierter Uplink-Verkehr eines bestimmten Benutzers in Bytes.
* `Benutzer>>>[email]>>>Verkehr>>>Downlink` (V2Ray 3.16+): Kumulierter Downlink-Verkehr eines bestimmten Benutzers in Bytes.
* `Inbound>>>[tag]>>>Verkehr>>>Uplink` (V2Ray 3.18+): Akkumulierte Uplink-Verkehr von bestimmten eingehenden, in Bytes.
* `Inbound>>>[tag]>>>Verkehr>>>Downlink` (V2Ray 3.18+): Akkumulierter Downlink-Verkehr spezifischen eingehenden, in Bytes.

## Tipps

* Wenn ein Benutzer keine gültige E-Mail-Adresse hat, werden die Statistiken nicht aktiviert.