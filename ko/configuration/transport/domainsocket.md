---
refcn: chapter_02/transport/domainsocket
refen: configuration/transport/domainsocket
---
# 도메인 소켓 전송

Domain Socket은 표준 Unix 도메인 소켓을 사용하여 데이터를 전송합니다. 도메인 소켓은 시스템 interal tranfer 채널입니다. 네트워크 버퍼에 용지 걸림이 발생하지 않으며 로컬 루프백 네트워크를 통해 전송하는 것보다 약간 더 빠를 수도 있습니다.

도메인 소켓은 macOS 및 Linux와 같이 Unix 도메인 소켓을 지원하는 플랫폼에서만 사용할 수 있습니다. Windows에서는 사용할 수 없습니다.

{% hint style='info' %}

When domain socket is used, IP and port specified on the inbound/outbound proxy will be ignored. All traffic is tunneled through the domain socket.

{% endhint %}

## DomainSocketObject

`DomainSocketObject` is used in `dsSettings` field in `TransportObject` and `StreamSettingsObject`.

```javascript
{
  "path": "/path/to/ds/file"
}
```

> `경로`: 문자열

An valid absolute file path. Before running V2Ray, the file on this path must not exist.