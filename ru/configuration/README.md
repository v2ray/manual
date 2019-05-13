---
refcn: chapter_02/index
refen: configuration/index
---

# Настройка

V2Ray использует конфиг на основе [protobuf](https://developers.google.com/protocol-buffers/). Поскольку формат protobuf слабо читабелен, V2Ray также поддерживает настройку в JSON. Перед запуском, V2Ray автоматически преобразует конфигурацию JSON в protobuf. В дальнейшем могут быть введены другие форматы конфигурации.

Здесь мы приводим конфигурацию на основе JSON.

JSON или [JavaScript Object Notation](https://en.wikipedia.org/wiki/JSON) - способ представления объектов в Javascript. Один JSON-файл содержит один и только один JSON-объект, начинающийся с «{» и завершающийся «}».

JSON-объект содержит список пар ключ-значение. Ключ - это строка, а значение может быть строкой, числом, логическим значением, массивом или другим объектом. Типичный объект выглядит следующим образом:

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

## Типы данных JSON

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