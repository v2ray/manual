# Blackhole

[![English][1]][2] [![Chinese][3]][4] [![German][5]][6] [![Russian][7]][8]

[1]: ../../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/protocols/blackhole.html
[3]: ../../resources/chinese.svg
[4]: https://www.v2ray.com/chapter_02/protocols/blackhole.html
[5]: ../../resources/german.svg
[6]: https://www.v2ray.com/de/configuration/protocols/blackhole.html
[7]: ../../resources/russian.svg
[8]: https://www.v2ray.com/ru/configuration/protocols/blackhole.html

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
