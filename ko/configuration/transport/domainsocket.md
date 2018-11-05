---
refcn: chapter_02/transport/domainsocket
refen: configuration/transport/domainsocket
---
# 도메인 소켓 전송

Domain Socket은 표준 Unix 도메인 소켓을 사용하여 데이터를 전송합니다. 도메인 소켓은 시스템 interal tranfer 채널입니다. 네트워크 버퍼에 용지 걸림이 발생하지 않으며 로컬 루프백 네트워크를 통해 전송하는 것보다 약간 더 빠를 수도 있습니다.

도메인 소켓은 macOS 및 Linux와 같이 Unix 도메인 소켓을 지원하는 플랫폼에서만 사용할 수 있습니다. Windows에서는 사용할 수 없습니다.

{% hint style = 'info'%} 도메인 소켓을 사용하면 인바운드 / 아웃 바운드 프록시에 지정된 IP 및 포트가 무시됩니다. 모든 트래픽은 도메인 소켓을 통해 터널링됩니다. {% endhint %}

## DomainSocketObject

`DomainSocketObject` 에서 사용되는 `dsSettings` 필드를 `TransportObject` 및 `StreamSettingsObject`.

```javascript
{
  "path": "/path/to/ds/file"
}
```

> `경로`: 문자열

유효한 절대 파일 경로. V2Ray를 실행하기 전에이 경로에있는 파일이 없어야합니다.