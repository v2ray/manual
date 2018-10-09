---
refcn: chapter_02/index
refen: configuration/index
---
# Настройка

V2Ray использует конфиг на основе [protobuf](https://developers.google.com/protocol-buffers/). Из-за низкой читаемости формата protobuf, V2Ray также поддерживает конфиг в JSON. Перед запуском, V2Ray автоматически преобразует конфигурацию JSON в protobuf. В дальнейшем могут быть введены другие форматы конфигурации.

Здесь мы приводим конфигурацию на основе JSON.

JSON или [JavaScript Object Notation](https://en.wikipedia.org/wiki/JSON) - способ представления объектов в Javascript. Один JSON-файл содержит один и только один JSON-объект, начинающийся с «{» и завершающийся «}».

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

Замечание:

1. Пара ключ-значение обычно завершается запятой «,», но после последнего элемента объекта запятая не ставится.
2. V2Ray поддерживает комментарии в JSON, аннотированные «//» или «/\* \*/».