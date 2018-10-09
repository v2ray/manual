---
refcn: chapter_02/protocols/blackhole
refen: configuration/protocols/blackhole
---
# Blackhole

Blackhole ist ein Protokoll für ausgehende Verbindungen. Es blockiert alle Verbindungen mit vordefinierten Antworten. Combined with [Routing](../routing.md), this can be used for blocking access to some websites.

* Name: Schwarzes Loch
* Typ: Ausgehend
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
  * `type`: Art der Antwort, verfügbare Optionen sind: 
    * `"none"`: Default value. Empty response.
    * `"http"`: Eine gültige HTTP 403-Antwort.