---
refcn: chapter_02/protocols/http
refen: configuration/protocols/http
---
# HTTP

* 이름: `blackhole`
* 유형: 인바운드

HTTP is a protocol for inbound connections. It is compatible with HTTP/1.1.

## InboundConfigurationObject

```javascript
{
  "accounts": [
    {
      "user": "my-username",
      "pass": "my-password"
    }
  ],
  "allowTransparent": false,
  "userLevel": 0
}
```

> `계정`: \ [[AccountObject](#accountobject)\]

각 항목이 계정 인 배열입니다. 기본적으로 비어 있습니다. 비어 있지 않으면 수신 요청에 HTTP 기본 인증이 필요합니다.

> `allowTransparent`: true | 그릇된

`설정하면 true이고`이면이 프록시에 대한 모든 HTTP 요청이 프록시가 아닌 요청을 포함하여 프록시됩니다.

> `userLevel`: number

사용자 수준. 모든 연결은이 수준을 공유합니다.

### AccountObject

```javascript
{
  "user": "my-username",
  "pass": "my-password"
}
```

> `사용자`: 문자열

HTTP 인증을위한 사용자 이름.

> `패스`: 문자열

hTTP 인증을위한 암호.

{% hint style='info' %}

Use the following settings in Linux to use HTTP proxy in current session.

* `내보내기 http_proxy = http: //127.0.0.1: 8080 /` (URL은 설정에 따라 변경해야 함)
* `https_proxy =$http_proxy내 보냅니다.`

{% endhint %}