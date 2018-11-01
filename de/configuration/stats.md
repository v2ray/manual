---
refcn: chapter_02/stats
refen: configuration/stats
---
# Statistics

V2Ray bietet einige Informationen über seine Interna.

## StatsObject

`StatsObject` is used as `stats` field in top level configuration.

```javascript
{
}
```

Alle Statistikzähler sind unten aufgeführt:

* `Benutzer>>>[email]>>>Verkehr>>>Uplink` (V2Ray 3.16+): Akkumulierter Uplink-Verkehr eines bestimmten Benutzers in Bytes.
* `Benutzer>>>[email]>>>Verkehr>>>Downlink` (V2Ray 3.16+): Kumulierter Downlink-Verkehr eines bestimmten Benutzers in Bytes.
* `Inbound>>>[tag]>>>Verkehr>>>Uplink` (V2Ray 3.18+): Akkumulierte Uplink-Verkehr von bestimmten eingehenden, in Bytes.
* `Inbound>>>[tag]>>>Verkehr>>>Downlink` (V2Ray 3.18+): Akkumulierter Downlink-Verkehr spezifischen eingehenden, in Bytes.

## Tips

* Wenn ein Benutzer keine gültige E-Mail-Adresse hat, werden die Statistiken nicht aktiviert.