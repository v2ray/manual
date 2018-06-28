# Blackhole

![English](../../resources/englishc.svg) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/blackhole.html)

Blackhole ist ein Protokoll für ausgehende Verbindungen. Es blockiert alle Verbindungen mit vordefinierten Antworten. Kombiniert mit [ Routing ](../03_routing.md) Dies kann zum Sperren des Zugriffs auf einige Websites verwendet werden.

* Name: blackhole
* Type: Outbound
* Konfiguration:

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