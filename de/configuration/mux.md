# Multiplexen

![Englisch](../resources/englishc.svg) [![Chinesisch](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/mux.html)

Multiplexing, oder Mux, verwendet eine physische TCP-Verbindung für mehrere virtuelle TCP-Verbindungen. Weitere Details zur Implementierung finden Sie unter [Mux.Cool](https://www.v2ray.com/eng/protocols/muxcool.html).

Aufbau:

```javascript
{"aktiviert": false, "Nebenläufigkeit": 8}
```

Woher:

* `enabled`: Ob Mux aktiv ist oder nicht
* `Nebenläufigkeit`: Maximale Anzahl an virtuellen Verbindungen, die eine physische Verbindung gleichzeitig bewältigen kann. Max. Wert `1024`, Mindestwert `1`, Standard `8`. 
  * Normalerweise müssen Sie diesen Wert nicht konfigurieren.