# Aufbau

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/index.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/index.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/index.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/index.html)

V2Ray verwendet eine Konfigurationsdatei im JSON-Format. Wenn Sie mit JSON vertraut sind, können Sie diese Seite überspringen.

JSON oder [JavaScript Object Notation](https://en.wikipedia.org/wiki/JSON), kurz gesagt, sind Objekte in Javascript. Eine JSON-Datei enthält ein und nur ein JSON-Objekt, beginnend mit "{" und endend mit "}".

Ein JSON-Objekt enthält eine Liste von Schlüsselwertpaaren. Ein Schlüssel ist eine Zeichenfolge, und ein Wert kann verschiedene Typen haben, wie z. B. Zeichenfolge, Zahl, Boolean, Array oder ein anderes Objekt. Ein typisches Objekt ist wie folgt:

```javascript
{
  "stringValue": "This is a string.",
  "numberValue": 42,
  "boolValue": true,
  "arrayValue": ["this", "is", "a", "string", "array"],
  "objectValue": {
    "another": "object"
  }
}
```

Beachten:

1. Ein Schlüsselwertpaar endet normalerweise mit einem Komma ",", darf aber nicht mit einem Komma enden, wenn es das letzte Element des Objekts ist.
2. V2Ray unterstützt Kommentare in JSON, die mit "//" oder "/ \ * \ * /" kommentiert sind.