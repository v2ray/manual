---
refcn: chapter_00/start
refen: welcome/start
---
# 빠른 시작

V2Ray를 설치 한 후에 구성해야합니다. 다음은 데모 실행을위한 빠른 구성입니다. 고급 설정은 [구성 개요](../configuration/overview.md) 을 참조하십시오.

## 고객 {#client}

PC (또는 모바일)에서 다음 구성으로 V2Ray를 실행하십시오.

```javascript
{
  "inbounds": [{
    "port": 1080,  // Port of socks5 proxy. 이 포트를 사용하도록 브라우저를 지정하십시오.
    "listen": "127.0.0.1",
    "protocol": "socks",
    "settings": {
      "udp": true
    }
  }],
  "outbounds": [{
    "protocol": "vmess",
    "settings": {
      "vnext": [{
        "address": "server", // Address of your V2Ray server. IP 또는 도메인 주소 일 수 있습니다.
        "port": 10086,  // Port of your V2Ray server.
        "users": [{ "id": "b831381d-6324-4d53-ad4f-8cda48b30811" }]
      }]
    }
  },{
    "protocol": "freedom",
    "tag": "direct",
    "settings": {}
  }],
  "routing": {
    "strategy": "rules",
    "settings": {
      "domainStrategy": "IPOnDemand",
      "rules": [{
        "type": "field",
        "ip": ["geoip:private"],
        "outboundTag": "direct"
      }]
    }
  }
}
```

위에서 언급 한 것처럼 V2Ray 서버의 IP 주소를 수정하십시오. 그런 다음 PC의 V2Ray 프로세스는 인트라넷 트래픽을 제외한 V2Ray 서버에 대한 모든 트래픽을 프록시합니다.

## 섬기는 사람 {#server}

V2Ray를 서버로 실행하려면 다른 컴퓨터가 필요합니다. 일반적으로이 컴퓨터는 방화벽 외부에 있습니다. 다음은 샘플 구성입니다.

```javascript
{
  "inbounds": [{
    "port": 10086, // 서버의 포트. 위와 같아야합니다.
    "프로토콜": "vmess",
    "설정": {
      "클라이언트": [{ "id": "b831381d-6324-4d53-ad4f-8cda48b30811"}]
    }
  }],
  "아웃 바운드" {
    "프로토콜": "자유",
    "설정": {}
  }]
}
```

`id` 필드가 클라이언트와 서버간에 동일해야합니다.

## 달리는 {#running}

* Windows 및 macOS에서 구성 파일은 V2Ray 바이너리와 동일한 디렉토리에 있습니다. 추가 매개 변수없이 `v2ray` 또는 `v2ray.exe` 을 실행할 수 있습니다.
* Linux에서 구성 파일은 일반적으로 `/etc/v2ray/config.json`있습니다. 실행 `v2ray --config =은 / etc / v2ray / config.json` 전경 또는 배경 프로세스로 V2Ray를 실행하는 systemd와 같은 다른 도구를 사용합니다.

구성에 대한 자세한 내용은 [개요](../configuration/overview.md) 을 참조하십시오.