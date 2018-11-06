* * *

refcn: chapter_02/protocols/dokodemo refen: configuration/protocols/dokodemo

* * *

# Dokodemo-door

* 이름 : `dokodemo-door`
* 유형 : 인바운드

Dokodemo-door는 인바운드 연결을위한 프로토콜입니다. 모든 연결을 취하여 지정된 대상으로 전달합니다.

Dokodemo-door는 (구성된 경우) 투명한 프록시로 작동 할 수도 있습니다.

## ConfigurationObject

```javascript
{
  "address": "8.8.8.8",
  "port": 53,
  "network": "tcp",
  "followRedirect": false,
  "userLevel": 0
}
```

> `주소`: 주소

대상 서버의 주소. 문자열 형식의 IPv4, IPv6 또는 도메인 일 수 있습니다. `followRedirect` (아래 참조)이 `이면 true`, `address` 는 비어있을 수 있습니다.

> `포트`: 번호

대상 서버의 포트입니다.

> `네트워크`: "tcp"| "udp"| "tcp, udp"

수용 할 수있는 네트워크 유형. `"tcp"` 이 지정되면이 dokodemo-door로 전송 된 모든 UDP 트래픽이 삭제됩니다.

> `followRedirect`: true | 그릇된

`설정하면`, dokodemo-door는 TProxy의 대상을 인식하여 대상으로 사용합니다. 자세한 내용은 [전송](../transport.md) `TProxy` 을 참조하십시오.

> `userLevel`: number

사용자 수준. 모든 연결은이 수준을 공유합니다. 자세한 내용은 [정책](../policy.md) 을 참조하십시오.

## 투명한 프록시의 예

다음과 같이 dokodemo-door를 인바운드에 추가하십시오.

```javascript
{
  "network": "tcp,udp",
  "timeout": 30,
  "followRedirect": true
}
```

iptables를 아래와 같이 설정하십시오.

```bash
# 새 체인 만들기
iptables -t nat -N V2RAY
iptables -t mangle -N V2RAY
iptables -t mangle -N V2RAY_MARK

# V2Ray 서버의 주소를 무시하십시오.
# 매우 중요합니다. 단지주의해야합니다.
iptables -t nat -A V2RAY -d 123.123.123.123 -j RETURN

# LAN을 무시하고 프록시를 사용하지 않으려는 다른 주소
# 예약 된 네트워크의 전체 목록은 Wikipedia 및 RFC5735를 참조하십시오.
iptables -t nat -A V2RAY -d 0.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 10.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 127.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 169.254.0.0/16 -j RETURN
iptables -t nat -A V2RAY -d 172.16.0.0/12 -j RETURN
iptables -t nat -A V2RAY -d 192.168 .0.0 / 16 -j RETURN
iptables -t nat -A V2RAY -d 224.0.0.0/4 -j RETURN
iptables -t nat -A V2RAY -d 240.0.0.0/4 -j RETURN

# 다른 모든 것은 리디렉션되어야합니다. Dokodemo-door의 로컬 포트
iptables -t nat -A V2RAY -p tcp -j REDIRECT --to 포트 12345

# UDP 규칙 추가
ip route add 로컬 기본 dev lo 테이블 100
ip rule add fwmark 1 lookup 100
iptables -t mangle -A V2RAY -p udp --dport 53 -j TPROXY - 포트 12345 --tproxy-mark 0x01 / 0x01
iptables -t mangle -A V2RAY_MARK -p udp --dport 53 -j MARK --set-mark 1

# 규칙 적용
iptables -t nat -A 출력 --p tcp -j V2RAY
iptables -t mangle -A PREROUTING -j V2RAY
iptables -t mangle -A OUTPUT -j V2RAY_MARK
```