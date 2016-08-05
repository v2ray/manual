## JSON 格式

V2Ray 的配置文件为 JSON 格式，如果你已经熟悉 JSON 格式，可以跳过这一段。

JSON，全称 [JavaScript Object Notation](https://en.wikipedia.org/wiki/JSON)，简而言之是 Javascript 
中的对象（Object）。一个 JSON 文件包含一个完整的对象，以大括号“{”开头，大括号“}”结束。

一个 JSON 对象包含一系列的键值对（Key-Value Pair），一个键是一个字符串（String），而值有多种类型，常
见的有字符串（String）、数字（Number）、布尔（Bool）、数组（Array）和对象（Object）。下面是一个 JSON
对象示例：

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

需要注意的是：

1. 通常一个键值对的后面需要有一个逗号","，但如果这个键值对后面紧跟一个大括号"｝"的话，则一定不能有逗号。
2. Javascript 中的注释符"//"和"/\* \*/"不能在 JSON 文件中使用。
