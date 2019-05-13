---
refcn: chapter_02/protocols/blackhole
refen: configuration/protocols/blackhole
---

# Blackhole

* 이름: `blackhole`
* 유형 : 아웃 바운드

블랙홀은 아웃 바운드 연결을위한 프로토콜입니다. 사전 정의 된 응답으로 모든 연결을 차단합니다. [Routing](../routing.md)과 결합하여 일부 웹 사이트에 대한 액세스를 차단하는 데 사용할 수 있습니다.

## ConfigurationObject

```javascript
{
  "response": {
    "type": "none"
  }
}
```

> `response`: [ResponseObject](#responseobject)

사전 정의 된 응답. Blockhole은 전달 된 연결에 대해 즉시 미리 정의 된 데이터를 보내고 연결을 종료합니다.

### ResponseObject

```javascript
{
  "type": "none"
}
```

> `type`: "none" | "http"

응답의 유형, 사용 가능한 옵션은 다음과 같습니다.

* `"없음"`: 기본값. 빈 응답.
* `"http"`: 유효한 HTTP 403 응답입니다.