---
refcn: chapter_02/transport/tcp
refen: configuration/transport/tcp
---
# TCP 전송

구성 :

```javascript
{
  "header": {
    "type": "none"
  }
}
```

어디에:

* `머리글`: 헤더 난독 처리 설정 : 
  * `유형`: 난독 화 유형. 선택 사항은 다음과 같습니다. 
    * `"없음"`: 기본값. 전혀 난독 화하지 않습니다.
    * `"http"`: HTTP 난독 화입니다. 아래를 참조하십시오.

## HTTP 난독 화

연결 피어의 인바운드 및 아웃 바운드에 대해 HTTP 난독 화를 구성 (및 일치)해야합니다.

```javascript
{
  "type": "http",
  "request": {
    "version": "1.1",
    "method": "GET",
    "path": ["/"],
    "headers": {
      "Host": ["www.baidu.com", "www.bing.com"],
      "User-Agent": [
        "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_0_2 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/53.0.2785.109 Mobile/14A456 Safari/601.1.46"
      ],
      "Accept-Encoding": ["gzip, deflate"],
      "Connection": ["keep-alive"],
      "Pragma": "no-cache"
    }
  },
  "response": {
    "version": "1.1",
    "status": "200",
    "reason": "OK",
    "headers": {
      "Content-Type": ["application/octet-stream", "video/mpeg"],
      "Transfer-Encoding": ["chunked"],
      "Connection": ["keep-alive"],
      "Pragma": "no-cache"
    }
  }
}
```

어디에:

* `타입`: 동일한 `종류` 에서와 같이 입력 `tcpSettings`.
* `의뢰`: HTTP 요청 설정 : 
  * `버전`: HTTP 버전, 기본값 `"1.1"`
  * `메소드`: HTTP 메소드, 기본값 `"GET"`.
  * `경로`: 경로. 문자열 배열입니다. 기본값은 `[ "/"]입니다.`. 값이 여러 개인 경우 각 요청에 대해 값이 임의로 선택됩니다.
  * `헤더`: HTTP 헤더. 키 값 쌍입니다. 각 키는 HTTP 헤더의 키이고 value는 HTTP 헤더의 값입니다. 여러 값을 설정하면 각 요청에 대해 유 효 값이 무작위로 선택됩니다. 기본 설정은 위의 예와 동일합니다.
* `응답`: HTTP 응답. 
  * `버전`: HTTP 버전. 기본값은 `"1.1"`입니다.
  * `상태`: HTTP 상태. 기본값은 `"200"`입니다.
  * `이유`: HTTP 상태 텍스트. 기본값은 `"OK"`.
  * `헤더`: HTTP 헤더. 요청 헤더와 동일하지만 응답.