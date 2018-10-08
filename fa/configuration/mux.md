* * *

refcn: chapter_02/mux refen: configuration/mux

* * *

# Multiplexing

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
* Mux is designed to reduce TCP handshake latency. It is NOT for high throughput. When used for downloading large files or speed measurement, Mux is usually slower than a normal TCP connection.