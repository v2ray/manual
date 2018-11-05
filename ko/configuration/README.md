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

{% hint style = 'info'%} V2Ray는 JSON에서 "//"또는 "/ \ * \ * /"로 주석 처리 된 주석을 지원합니다. 주석을 지원하지 않는 편집기에서는 오류로 표시 될 수 있지만 주석은 실제로 V2Ray에서 제대로 작동합니다. {% endhint %}

## JSON 데이터 유형

다음은 JSON 데이터 유형에 대한 간략한 소개입니다. 그것들은 나머지 문서들에서 참조 될 것입니다.

> `부울`: true | 그릇된

부울 값은 `이어야합니다. true` 또는 `false`, 인용 부호없이.

> `번호`

대개 음수가 아닌 음수가 아닌 정수입니다.

> `끈`

따옴표로 묶인 일련의 문자입니다.

> `배열`: []

요소의 배열. 그 요소의 타입은 대개 동일합니다. 예를 들어, `[string]` 는 `문자열`의 배열입니다.

> `개체`: {}

목적. 키 값 쌍 목록이 함께 제공됩니다.

{% 힌트 스타일 = '선단부'%} 키값 쌍 일반적 콤마로 끝난다는 객체의 마지막 요소가 ","해야하지만하지 콤마로 끝난다. {% endhint %}

## V2Ray 일반 데이터 형식

> `지도`: 개체 \ {문자열, 문자열 \}

키와 값에 고정 유형이있는 객체입니다.

> `주소`: 문자열

문자열 형식의 IP 또는 도메인 주소 (예 : `"8.8.8.8"` 또는 `"www.v2ray.com"`

> `_ 포트`: 문자열

`어드레스` 포트와 같은 `"8.8.8.8:53"` 또는 `'www.v2ray.com:80 "`. 일부 용도에서, 주소 부분은 같이 생략 될 수 `"443"`.