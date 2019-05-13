---
refcn: chapter_02/index
refen: configuration/index
---

# 구성

V2Ray는 [protobuf](https://developers.google.com/protocol-buffers/)기반 구성을 사용합니다. protobuf 형식은 읽기 쉽지 않기 때문에 V2Ray는 JSON에서 구성을 지원합니다. V2Ray가 실행되기 전에 JSON 구성이 자동으로 protobuf로 변환됩니다. 즉, 다른 구성 형식이 도입 될 수 있습니다.

여기에서는 JSON 기반 구성을 소개합니다.

JSON 또는 [자바 스크립트 객체 표기법](https://en.wikipedia.org/wiki/JSON)은 자바 스크립트의 객체입니다. 하나의 JSON 파일에는 "{"로 시작하고 "}"로 끝나는 단 하나의 JSON 객체 만 들어 있습니다.

JSON 객체는 키 값 쌍의 목록을 포함합니다. 키는 문자열이며 값은 문자열, 숫자, 부울, 배열 또는 다른 객체와 같은 다양한 유형이 될 수 있습니다. 일반적인 객체는 아래와 같습니다.

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

## JSON 데이터 유형

Here is a brief introduction of JSON data types. They will be referenced in the rest of docs.

> `부울`: true | 그릇된

Boolean value, has to be either `true` or `false`, without quotation mark.

> `번호`

Usually non-negative integers, without quotation mark.

> `끈`

Sequence of characters, surrounded by quotation mark.

> `배열`: []

Array of elements. The type of its elements is usually the same, e.g., `[string]` is an array of `string`s.

> `object`: {}

Object. It comes with a list of key value pairs.

{% hint style='tip' %}

A key value pair usually ends with a comma ",", but must not ends with a comma if it is the last element of the object.

{% endhint %}

## V2Ray 일반 데이터 형식

> `map`: object \{string, string\}

An object whose keys and values have fixed types.

> `주소`: 문자열

An IP or domain address in string form, such as `"8.8.8.8"` or `"www.v2ray.com"`

> `_ 포트`: 문자열

An `address` with port, such as `"8.8.8.8:53"` or `"www.v2ray.com:80"`. In some usages, the address part can be omitted, like `":443"`.