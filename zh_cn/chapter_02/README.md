# 配置文件

![Chinese](../resources/chinesec.svg) [![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/)

V2Ray 的配置文件为 JSON 格式，如果你已经熟悉 JSON 格式，可以跳过这一段。

JSON，全称 [JavaScript Object Notation](https://en.wikipedia.org/wiki/JSON)，简而言之是 Javascript 中的对象（Object）。一个 JSON 文件包含一个完整的对象，以大括号“{”开头，大括号“}”结束。

一个 JSON 对象包含一系列的键值对（Key-Value Pair），一个键是一个字符串（String），而值有多种类型，常见的有字符串（String）、数字（Number）、布尔（Bool）、数组（Array）和对象（Object）。下面是一个 JSON对象示例：

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
1. V2Ray 的 JSON 格式支持注释，可使用“//”或者“/\* \*/”来进行注释。

## 小贴士 {#tip}
*  关于V2ray Wiki的配置示例，请参照 协议类型 确定 示例配置 在 V2ray配置文件中 的所属位置
  * 举例（此例为[VMESS的传出协议配置](./protocols/vmess.md)）

```javascript
//  "outbound": {
//    "protocol": "vmess",
//    "settings": 
      {
        "vnext": [
          {
            "address": "127.0.0.1",
            "port": 37192,
            "users": [
              {
                "id": "27848739-7e62-4138-9fd3-098a63964b6b",
                "alterId": 10,
                "security": "auto",
                "level": 0
              }
            ]
          }
        ]
      }
//  }
```
