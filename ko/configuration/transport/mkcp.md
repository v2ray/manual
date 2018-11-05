---
refcn: chapter_02/transport/mkcp
refen: configuration/transport/mkcp
---
# mKCP 전송

mKCP는 안정적인 스트림 전송입니다. UDP 기반 프로토콜입니다. mKCP는 더 낮은 대기 시간을 위해 더 많은 트래픽을 전송합니다. 동일한 양의 데이터를 전송하려면 일반적으로 mKCP가 TCP보다 많은 처리량이 필요합니다.

## KcpObject

```javascript
{
  "mtu": 1350,
  "tti": 20,
  "uplinkCapacity": 5,
  "downlinkCapacity": 20,
  "congestion": false,
  "readBufferSize": 1,
  "writeBufferSize": 1,
  "header": {
    "type": "none"
  }
}
```

> `mtu`: number

최대 전송 단위. UDP 패킷이 전송할 수있는 최대 수 바이트 수를 나타냅니다. 권장 값은 `576` 에서 `1460`입니다. 기본값 `1350`.

> `tti`: 숫자

전송 시간 간격 (밀리 초). mKCP는이 간격으로 데이터를 보냅니다. 권장 값은 `10` ~ `100`입니다. 기본값 `50`.

> `업 링크 용량`: 번호

업 링크 대역폭 (MB / s). V2Ray 인스턴스가 원격지로 데이터를 업로드하기위한 최대 대역폭. 기본값은 `5`입니다. 비트가 아니라 바이트 (MB / s)임을주의하십시오. 작은 대역폭을 위해 값 `0` 을 사용할 수 있습니다.

> `downlinkCapacity`: 숫자

다운 링크 대역폭 (MB / s). V2Ray 인스턴스가 데이터를 다운로드 할 수있는 최대 대역폭. 기본값은 `20`입니다. 비트가 아니라 바이트 (MB / s)임을주의하십시오. 작은 대역폭을 위해 값 `0` 을 사용할 수 있습니다.

{% hint style = 'info'%} `업 링크 용량` 와 `다운 링크 용량` 는 mKCP의 속도를 결정합니다. 클라이언트 측에서 `uplinkCapacity` 은 클라이언트가 서버로 데이터를 보내는 속도를 지정합니다. 서버 측에서 `downlinkCapacity` 은 서버 수신 데이터의 속도를 지정합니다. 이 쌍의 최소값은 실제 연결에서 효과적입니다. {% endhint %}

> `혼잡`: 참 | 그릇된

폭주 제어를 사용할지 여부. 기본값은 `입니다. false`. 정체 제어가 활성화되면 V2Ray는 네트워크 품질을 감지합니다. 패킷 손실이 심할 때 패킷을 적게 보내고 네트워크가 완전히 채워지지 않으면 더 많은 데이터를 보냅니다.

> `readBufferSize`: 숫자

단일 연결의 읽기 버퍼 크기 (MB). 기본값은 `2`입니다.

> `writeBufferSize`: 숫자

단일 연결에 대한 쓰기 버퍼 크기 (MB). 기본값은 `2`입니다.

> `header`: [HeaderObject]{#headerobject}

Configuration for packet header obfuscation.

### HeaderObject

```javascript
{
  "type": "none"
}
```

> `type`: string

Type of obfuscation. Corresponding inbound and outbound proxy must have the same settings. Choices are:

* `"none"`: Default value. No obfuscation is used.
* `"srtp"`: Obfuscated as SRTP traffic. It may be recognized as video calls such as Facetime.
* `"utp"`: Obfuscated as uTP traffic. It may be recognized as Bittorrent traffic.
* `"wechat-video"`: Obfuscated to WeChat traffic.
* `"dtls"`: Obfuscated as DTLS 1.2 packets.
* `"wireguard"`: Obfuscated as WireGuard packets. (NOT true WireGuard protocol)

## 크레딧 {#credits}

* @skywind3000 invented the original KCP protocol and implemented in C.
* @xtaci re-implement KCP protocol in Go.
* @xiaokangwang integrated KCP into V2Ray.