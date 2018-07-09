# Blackhole

[![English](../../resources/english.svg)](https://www.v2ray.com/en/configuration/protocols/blackhole.html) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/blackhole.html) [![German](../../resources/german.svg)](https://www.v2ray.com/de/configuration/protocols/blackhole.html) [![Russian](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/protocols/blackhole.html)

Blackhole is a protocol for outbound connections. It blocks all connections with pre-defined responses. Combined with [Routing](../routing.md), this can be used for blocking access to some websites.

* Name: blackhole
* Type: Outbound
* Configuration:

```javascript
{
  "response": {
    "type": "none"
  }
}
```

Where:

* `response`: Pre-defined response. Blockhole will send (if any) pre-defined data immediately for any connection passed to it and close the connection. 
  * `type`: Type of the response, available options are: 
    * `"none"`: Default value. Empty response.
    * `"http"`: A valid HTTP 403 response.