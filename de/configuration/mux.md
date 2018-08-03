# Multiplexen

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/mux.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/mux.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/mux.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/mux.html)

Multiplexing, oder Mux, verwendet eine physische TCP-Verbindung für mehrere virtuelle TCP-Verbindungen. Weitere Details zur Implementierung finden Sie unter [Mux.Cool](https://www.v2ray.com/eng/protocols/muxcool.html).

Aufbau:

```javascript
{"aktiviert": false, "Nebenläufigkeit": 8}
```

Woher:

* `enabled`: Ob Mux aktiv ist oder nicht
* `Nebenläufigkeit`: Maximale Anzahl an virtuellen Verbindungen, die eine physische Verbindung gleichzeitig bewältigen kann. Max. Wert `1024`, Mindestwert `1`, Standard `8`. 
  * Normalerweise müssen Sie diesen Wert nicht konfigurieren.
* Mux is designed to reduce TCP handshake latency. It is NOT for high throughput. When used for downloading large files or speed measurement, Mux is usually slower than a normal TCP connection.