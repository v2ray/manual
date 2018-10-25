---
refcn: chapter_02/mux
refen: configuration/mux
---
# Multiplexen

Multiplexing, oder Mux, verwendet eine physische TCP-Verbindung für mehrere virtuelle TCP-Verbindungen. Weitere Details zur Implementierung finden Sie unter [Mux.Cool](https://www.v2ray.com/eng/protocols/muxcool.html).

Konfiguration:

```javascript
{"aktiviert": false, "Nebenläufigkeit": 8}
```

Wo:

* `enabled`: Ob Mux aktiv ist oder nicht
* `Nebenläufigkeit`: Max number of virtual connections that one physical connection can handle at a time. Max value `1024`, min value `1`, default `8`. 
  * Normalerweise müssen Sie diesen Wert nicht konfigurieren.
* Mux is designed to reduce TCP handshake latency. It is NOT for high throughput. When used for downloading large files or speed measurement, Mux is usually slower than a normal TCP connection.