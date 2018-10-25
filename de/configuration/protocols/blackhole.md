---
refcn: chapter_02/protocols/blackhole
refen: configuration/protocols/blackhole
---
# Blackhole

Blackhole ist ein Protokoll für ausgehende Verbindungen. Es blockiert alle Verbindungen mit vordefinierten Antworten. Kombiniert mit [ Routing ](../routing.md) Dies kann zum Sperren des Zugriffs auf einige Websites verwendet werden.

* Name: Schwarzes Loch
* Typ: Ausgehend
* Konfiguration:

```javascript
{
  "response": {
    "type": "none"
  }
}
```

Wo:

* `response`: Pre-defined response. Blockhole will send (if any) pre-defined data immediately for any connection passed to it and close the connection. 
  * `type`: Art der Antwort, verfügbare Optionen sind: 
    * `"none"`: Default value. Empty response.
    * `"http"`: Eine gültige HTTP 403-Antwort.