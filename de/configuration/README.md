---
refcn: chapter_02/index
refen: configuration/index
---
# Konfiguration

V2Ray uses [protobuf](https://developers.google.com/protocol-buffers/)-based configuration. As protobuf format is less readable, V2Ray also supports configuration in JSON. Before V2Ray runs, it automatically converts JSON config into protobuf. That being said, other configuration formats may be introduced in the furture.

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

{% hint style='info' %}

V2Ray supports comments in JSON，annotated by "//" or "/\* \*/". In an editor that doesn't support comments, they may get displayed as errors, but comments actually work fine in V2Ray.

{% endhint %}

## JSON Data Types

Here is a brief introduction of JSON data types. They will be referenced in the rest of docs.

> `boolean`: true | false

Boolean value, has to be either `true` or `false`, without quotation mark.

> `number`

Usually non-negative integers, without quotation mark.

> `string`

Sequence of characters, surrounded by quotation mark.

> `array`: []

Array of elements. The type of its elements is usually the same, e.g., `[string]` is an array of `string`s.

> `object`: {}

Object. It comes with a list of key value pairs.

{% hint style='tip' %}

A key value pair usually ends with a comma ",", but must not ends with a comma if it is the last element of the object.

{% endhint %}

## V2Ray Common Data Types

> `map`: object \{string, string\}

An object whose keys and values have fixed types.

> `address`: string

An IP or domain address in string form, such as `"8.8.8.8"` or `"www.v2ray.com"`

> `address_port`: string

An `address` with port, such as `"8.8.8.8:53"` or `"www.v2ray.com:80"`. In some usages, the address part can be omitted, like `":443"`.