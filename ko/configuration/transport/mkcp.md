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

{% hint style='info' %}

`uplinkCapacity` and `downlinkCapacity` determine the speed of mKCP. On client side, `uplinkCapacity` specifies the speed for client sending data to server. On sever side, `downlinkCapacity` specifies the speed of server receiving data. The minimum of this pair is effective in an actual connection.

{% endhint %}

> `혼잡`: 참 | 그릇된

Whether or not to enable congestion control. Default value is `false`. When congestion control is enabled, V2Ray will detect network quality. It will send less packets when packet loss is severe, or more data when network is not fully filled.

> `readBufferSize`: 숫자

Read buffer size for a single connection, in MB. Default value is `2`.

> `writeBufferSize`: 숫자

Write buffer size for a single connection, in MB. Default value is `2`.

> `header`: [HeaderObject](#headerobject)

Configuration for packet header obfuscation.

### HeaderObject

```javascript
{
  "type": "none"
}
```

> `유형`: 문자열

Type of obfuscation. Corresponding inbound and outbound proxy must have the same settings. Choices are:

* `"없음"`: 기본값. 난독 화는 사용되지 않습니다.
* `"srtp"`: SRTP 트래픽으로 난독 화됩니다. Facetime과 같은 화상 통화로 인식 될 수 있습니다.
* `"utp"`: uTP 트래픽으로 난독 화. Bittorrent 트래픽으로 인식 될 수 있습니다.
* `"wechat-video"`: WeChat 트래픽으로 난독 화됩니다.
* `"dtls"`: DTLS 1.2 패킷으로 난독 화.
* `"wireguard"`: WireGuard 패킷으로 난독 화. (사실 WireGuard 프로토콜이 아닙니다)

## 크레딧 {#credits}

* @ skywind3000은 원래의 KCP 프로토콜을 발명하고 C로 구현했습니다.
* @xtaci는 Go에서 KCP 프로토콜을 다시 구현합니다.
* @xiaokangwang은 KCP를 V2Ray에 통합했습니다.