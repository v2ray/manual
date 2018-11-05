---
refcn: chapter_02/protocols/blackhole
refen: configuration/protocols/blackhole
---
# Blackhole

* Name: `blackhole`
* Typ: Ausgehend

Blackhole ist ein Protokoll für ausgehende Verbindungen. Es blockiert alle Verbindungen mit vordefinierten Antworten. Kombiniert mit [ Routing ](../routing.md) Dies kann zum Sperren des Zugriffs auf einige Websites verwendet werden.

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