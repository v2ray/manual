# Настройка

[![Английский](../resources/english.svg)](https://www.v2ray.com/en/configuration/index.html) [![Китайский](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/index.html) [![Немецкий](../resources/german.svg)](https://www.v2ray.com/de/configuration/index.html) [![Русский](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/index.html)

V2Ray использует файл конфигурации в формате JSON. Если вы знакомы с JSON, вы можете пропустить эту страницу.

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

Замечания:

1. Пара ключ-значение обычно завершается запятой «,», но после последнего элемента объекта запятая не ставится.
2. V2Ray поддерживает комментарии в JSON, аннотированные «//» или «/\* \*/».