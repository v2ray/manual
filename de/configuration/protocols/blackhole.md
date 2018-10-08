* * *

refcn: chapter_02/protocols/blackhole refen: configuration/protocols/blackhole

* * *

# Blackhole

Blackhole ist ein Protokoll für ausgehende Verbindungen. Es blockiert alle Verbindungen mit vordefinierten Antworten. Combined with [Routing](../routing.md), this can be used for blocking access to some websites.

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

Woher:

* `response`: Vordefinierte Antwort Blockhole sendet (falls vorhanden) vordefinierte Daten sofort für jede Verbindung, die an es weitergeleitet wird, und schließt die Verbindung. 
  * `type`: Art der Antwort, verfügbare Optionen sind: 
    * `"none"`: Standardwert. Leere Antwort.
    * `"http"`: Eine gültige HTTP 403-Antwort.