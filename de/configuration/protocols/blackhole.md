# Blackhole

![Englisch](../../resources/englishc.svg) [![Chinesisch](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/blackhole.html)

Blackhole ist ein Protokoll für ausgehende Verbindungen. Es blockiert alle Verbindungen mit vordefinierten Antworten. Kombiniert mit [ Routing ](../03_routing.md) Dies kann zum Sperren des Zugriffs auf einige Websites verwendet werden.

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