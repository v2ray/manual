---
refcn: chapter_02/protocols/blackhole
refen: configuration/protocols/blackhole
---

# Blackhole

* Name: blackhole
* Type: Outbound

Blackhole is a protocol for outbound connections. It blocks all connections with pre-defined responses. Combined with [Routing](../routing.md), this can be used for blocking access to some websites.

## ConfigurationObject

```javascript
{
  "response": {
    "type": "none"
  }
}
```

> `response`: [ResponseObject](#responseobject)

Pre-defined response. Blockhole will send (if any) pre-defined data immediately for any connection passed to it and close the connection.

### ResponseObject

```javascript
{
  "type": "none"
}
```

> `type`: "none" | "http"

Type of the response, available options are:

* `"none"`: Default value. Empty response.
* `"http"`: A valid HTTP 403 response.
