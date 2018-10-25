---
refcn: chapter_02/index
refen: configuration/index
---

# 配置文件

V2Ray 本身使用基于 [Protobuf](https://developers.google.com/protocol-buffers/) 的配置。由于 Protobuf 的文本格式不方便阅读，V2Ray 同时也支持 JSON 格式的配置。在运行之前，V2Ray 会自动将 JSON 转换为对应的 Protobuf。换言之，V2Ray 将来也可能会支持其它格式的配置。

以下介绍一下基于 JSON 格式的配置。

JSON，全称 [JavaScript Object Notation](https://en.wikipedia.org/wiki/JSON)，简而言之是 Javascript 中的对象（Object）。一个 JSON 文件包含一个完整的对象，以大括号“{”开头，大括号“}”结束。

一个 JSON 对象包含一系列的键值对（Key-Value Pair），一个键是一个字符串（String），而值有多种类型，常见的有字符串（String）、数字（Number）、布尔（Bool）、数组（Array）和对象（Object）。下面是一个简单的 JSON对象示例：

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

{% hint style='tip' %}
通常一个键值对的后面需要有一个逗号","，但如果这个键值对后面紧跟一个大括号"｝"的话，则一定不能有逗号。
{% endhint %}

{% hint style='info' %}
V2Ray 的 JSON 格式支持注释，可使用“//”或者“/\* \*/”来进行注释。在不支持注释的编辑器中可能被显示为“错误”，但实际上是可以正常使用的。
{% endhint %}
