# Multiplexing

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/mux.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/mux.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/mux.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/mux.html)

Multiplexing, or Mux, is to use one physical TCP connections for multiple virtual TCP connections. See [Mux.Cool](https://www.v2ray.com/eng/protocols/muxcool.html) for more implementation details.

Configuration:

```javascript
{
  "enabled": false,
  "concurrency": 8
}
```

Where:

* `enabled`: Whether or not to enable Mux
* `concurrency`: Max number of virtual connections that one physical connection can handle at a time. Max value `1024`, min value `1`, default `8`. 
  * Usually you don't have to configure this value.