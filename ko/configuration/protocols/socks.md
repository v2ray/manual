---
refcn: chapter_02/protocols/socks
refen: configuration/protocols/socks
---
# Socks

* 이름 : `양말`
* 유형 : 인바운드 / 아웃 바운드

양말 호환 표준 SOCKS 프로토콜의 구현이며, [양말 4](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol), 양말 4a 및도 [양말 5](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol).

## 아웃 바운드 프록시 구성

```javascript
{
  "servers": [{
    "address": "127.0.0.1",
    "port": 1234,
    "users": [
      {
        "user": "test user",
        "pass": "test pass",
        "level": 0
      }
    ]
  }]
}
```

어디에:

* `서버`: 각 항목에있는 양말 서버 목록 : 
  * `주소`: 서버 주소
  * `포트`: 서버 포트
  * `사용자`: 사용자 계정 목록 : 
    * `사용자`: 사용자 이름
    * `패스`: 패스워드
    * `수준`: 사용자 수준입니다.

주의:

* 사용자 목록이 비어 있지 않으면, socks는 무작위 사용자를 사용하여 원격 서버로 성능 사용자 인증을 수행합니다.
* SOCKS5 서버 만 지원합니다.

## 인바운드 프록시 구성

```javascript
{
  "의 인증": "NOAUTH '
  '계정 '[
    {
      "사용자 ""내 - 이름 ",
      "패스 ""내 비밀번호 "
    }
  ,
  "UDP "거짓 ,
  "ip": "127.0.0.1",
  "userLevel": 0
}
```

어디에:

* `정식`: 양말 인증 방법. 기본값은 `"noauth"`. 옵션은 다음과 같습니다. 
  * `"noauth"`: 익명.
  * `"암호"`: 사용자 및 암호 [RFC 1929](https://tools.ietf.org/html/rfc1929)
* `계정`: 각 항목이 들어있는 배열 `사용자` 사용자 이름 및 `패스` 암호. 기본값은 비어 있습니다. 
  * `인증` 이 `일 때만 작동합니다. "비밀번호"`
* `udp`: `true` 또는 `false UDP를 사용 가능하게하려면` . 기본값은 false입니다.
* `ip`: UDP가 활성화되면이 IP 주소는 클라이언트로부터 UDP 패킷을받습니다. 기본값은 `"127.0.0.1"`입니다.
* `userLevel`: 사용자 수준. 모든 연결은이 수준을 공유합니다.