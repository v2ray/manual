# Blackhole

[![English](../../resources/english.svg)](https://www.v2ray.com/en/configuration/protocols/blackhole.html) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/blackhole.html) [![German](../../resources/german.svg)](https://www.v2ray.com/de/configuration/protocols/blackhole.html) [![Russian](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/protocols/blackhole.html)

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