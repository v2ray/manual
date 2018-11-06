---
refcn: chapter_02/reverse
refen: configuration/reverse
---
# 역방향 프록시

역방향 프록시는 V2Ray의 선택적 기능입니다. 서버에서 클라이언트로 트래픽을 리디렉션합니다. 따라서 "역방향"프록 싱이라고합니다.

{% hint style='tip' %}

Reverse proxy is available in V2Ray 4.0+. It is now in beta, and may be improved in near future.

{% endhint %}

Reverse proxy works in the following way:

* 웹 서버를 실행하는 장치 A가 있다고 가정합니다. 장치 A에는 공용 IP 주소가 없으므로 인터넷에서 액세스 할 수 없습니다. 인터넷에서 액세스 할 수있는 클라우드 서버라고하는 또 다른 장치 B가 있습니다. 우리는 B를 포털로 사용하여 traffice를 A로 리디렉션해야합니다.
* 이제 우리는 `bridge`이라는 이름의 장치 A에 V2Ray를 설치합니다. 그런 다음 장치 `포털`이라는 V2Ray를 설치합니다.
* `브리지` 은 `포털`연결을 엽니 다. 대상은 라우팅 용도로 사용자 정의 할 수 있습니다. `포털` 은 인터넷에서 다른 용도의 연결은 물론이 연결을받습니다. `포털` 은이 두 종류의 연결을 "연결"합니다. 그러면 interent 트래픽은 `bridge`로 터널링됩니다.
* `브릿지` 이 `포털`통해 인터넷 트래픽을 수신하면 localhost의 웹 서버에 이러한 트래픽을 보냅니다. 이러한 트래픽에 대한 라우팅을 구성 할 수도 있습니다.
* `브릿지` 은 트래픽 양에 따라로드 밸런스를 제어합니다.

{% hint style='danger' %}

Reverse proxy has already leveraged [Mux](mux.md). It is not necessary to configure Mux again on its outbound.

{% endhint %}

## 역 객체

`ReverseObject` is used as `reverse` field in top level configuration.

```javascript
{
  "bridges": [{
    "tag": "bridge",
    "domain": "test.v2ray.com"
  }],
  "portals": [{
    "tag": "portal",
    "domain": "test.v2ray.com"
  }]
}
```

> `브릿지`: \ [[BridgeObject](bridgeobject)\]

An array of `bridge`s. Each `bridge` is a [BridgeObject](bridgeobject).

> `포털`: \ [[PortalObject](portalobject)\]

An array of `portal`s. Each `portal` is a [PortalObject](bridgeobject).

### BridgeObject

```javascript
{
  "tag": "bridge",
  "domain": "test.v2ray.com"
}
```

> `태그`: 문자열

A tag. All traffic initiated by this `bridge` will have this tag. It can be used for [routing](routing.md), identified as `inboundTag`.

> `도메인`: 문자열

A domain. All connections initiated by `bridge` towards `portal` will use this domain as target. This domain is only used for communication between `bridge` and `portal`. It is not necessary to be actually registered.

### PortalObject

> `태그`: 문자열

A Tag. You need to redirect all traffic to this `portal`, by targeting `outboundTag` to this `tag`. The traffic includes the connections from `bridge`, as well as internet traffic.

> `도메인`: 문자열

A domain. When a connection targeting this domain, `portal` considers it is a connection from `bridge`, otherwise it is an internet connection.

{% hint style='tip' %}

Like other usages, a V2Ray instance can be used as a `bridge`, or a `portal`, or both as the same time.

{% endhint %}

## 구성 예

`bridge` usually needs two outbounds. One for connecting `portal`, and another for connecting local web server.

Reverse:

```javascript
{
  "bridges": [{
    "tag": "bridge",
    "domain": "test.v2ray.com"
  }]
}
```

Outbound:

```javascript
{
  "tag": "out"
  "protocol": "freedom",
  "settings": {
    "redirect": "127.0.0.1:80" // Send traffic to local web server
  }
},
{
  "protocol": "vmess",
  "settings": {
    "vnext": [{
      "address": "portal的IP地址",
      "port": 1024,
      "users": [{"id": "27848739-7e62-4138-9fd3-098a63964b6b"}]
    }]
  },
  "tag": "interconn"
}
```

Routing:

```javascript
"routing": {
  "strategy": "rules",
  "settings": {
    "rules": [{
      "type": "field",
      "inboundTag": ["bridge"],
      "domain": ["full:test.v2ray.com"],
      "outboundTag": "interconn"
    },{
      "type": "field",
      "inboundTag": ["bridge"],
      "outboundTag": "out"
    }]
  }
}
```

`portal` usually needs two inbounds. One for connections from `bridge`, and another for internet connections.

Reverse:

```javascript
{
  "portals": [{
    "tag": "portal",
    "domain": "test.v2ray.com"  // Must be the same as in bridge
  }]
}
```

Inbound:

```javascript
{
  "tag": "external",
  "port": 80,  // Open port 80 for internet HTTP traffic
  "protocol": "dokodemo-door",
  "settings": {
    "address": "127.0.0.1",
    "port": 80,
    "network": "tcp"
  }
},
{
  "port": 1024, // For bridge connections
  "tag": "interconn",
  "protocol": "vmess",
  "settings": {
    "clients": [{"id": "27848739-7e62-4138-9fd3-098a63964b6b"}]
  }
}
```

Routing:

```javascript
"routing": {
  "strategy": "rules",
  "settings": {
    "rules": [{
      "type": "field",
      "inboundTag": ["external"],
      "outboundTag": "portal"
    },{
      "type": "field",
      "inboundTag": ["interconn"],
      "outboundTag": "portal"
    }]
  }
}
```

{% hint style='tip' %}

In practice, you may want to run `bridge` first and then `portal`.

{% endhint %}