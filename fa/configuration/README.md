# Configuration

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/index.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/index.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/index.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/index.html)

V2Ray uses configuration file in JSON format. If you are familiar with JSON, you may skip this page.

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

Notice:

1. A key value pair usually ends with a comma ",", but must not ends with a comma if it is the last element of the object.
2. V2Ray supports comments in JSON, annotated by "//" or "/\* \*/".