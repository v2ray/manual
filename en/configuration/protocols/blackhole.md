# Blackhole

Blackhole is a protocol for outbound connections. It blocks all connections with pre-defined responses. Combined with [Routing](../03_routing.md), this can be used for blocking access to some websites.

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
