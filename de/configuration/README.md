---
refcn: chapter_02/index
refen: configuration/index
---
# Aufbau

V2Ray uses [protobuf](https://developers.google.com/protocol-buffers/)-based configuration. Due the low readability of protobuf format, V2Ray also supports configuration in JSON. Before V2Ray runs, it automatically converts JSON config into protobuf. That being said, other configuration formats may be introduced in the furture.

Here we introduce the JSON-based configuration.

JSON, or [JavaScript Object Notation](https://en.wikipedia.org/wiki/JSON), in short is objects in Javascript. One JSON file contains one and only one JSON object, beginning with "{" and ending with "}".

A JSON object contains a list of key value pairs. A key is a string, and a value may be various of types, such as string, number, boolean, array or another object. A typical object is like below:

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