---
refcn: chapter_02/transport/mkcp
refen: configuration/transport/mkcp
---

# mKCP Transport

mKCP is a reliable stream transport. It is an UDP based protocol. mKCP sends more traffic for lower latency. To transfer the same amount of data, mKCP usually requires more throughput than TCP does.

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

Maximum transmission unit. It indicates the maxium number bytes that an UDP packet can carry. Recommended value is between `576` and `1460`. Default value `1350`.

> `tti`: number

Transmission time interval, in milli-second. mKCP sends data in this interval. Recommended value is between `10` and `100`. Default value `50`.

> `uplinkCapacity`: number

Uplink bandwidth, in MB/s. The maximum bandwidth for the V2Ray instance to upload data to a remote one. Default value is `5`. Please note it is byte (in MB/s), not bit. One may use value `0` for a small bandwidth.

> `downlinkCapacity`: number

Downlink bandwidth, in MB/s. The maximum bandwidth for the V2Ray instance to download data. Default value is `20`. Please note it is byte (in MB/s), not bit. One may use value `0` for a small bandwidth.

{% hint style='info' %}
`uplinkCapacity` and `downlinkCapacity` determine the speed of mKCP. On client side, `uplinkCapacity` specifies the speed for client sending data to server. On sever side, `downlinkCapacity` specifies the speed of server receiving data. The minimum of this pair is effective in an actual connection.
{% endhint %}

> `congestion`: true | false

Whether or not to enable congestion control. Default value is `false`. When congestion control is enabled, V2Ray will detect network quality. It will send less packets when packet loss is severe, or more data when network is not fully filled.

> `readBufferSize`: number

Read buffer size for a single connection, in MB. Default value is `2`.

> `writeBufferSize`: number

Write buffer size for a single connection, in MB. Default value is `2`.

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

## Credits {#credits}

* @skywind3000 invented the original KCP protocol and implemented in C.
* @xtaci re-implement KCP protocol in Go.
* @xiaokangwang integrated KCP into V2Ray.
