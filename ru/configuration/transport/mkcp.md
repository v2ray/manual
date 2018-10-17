---
refcn: chapter_02/transport/mkcp
refen: configuration/transport/mkcp
---
# Доставка через mKCP

mKCP is a reliable stream transport. It is an UDP based protocol.

Конфигурация:

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

Где:

* `mtu`: Maximum transmission unit. Устанавливает максимальное количество байт, которые может содержать пакет UDP. Рекомендуемое значение между `576` и `1460`. По умолчанию `1350`.
* `tti`: Transmission time interval, in milli-second. mKCP sends data in this interval. Recommended value is between `10` and `100`. Default value `50`.
* `uplinkCapacity`: Uplink bandwidth, in MB/s. The maximum bandwidth for the V2Ray instance to upload data to a remote one. Default value is `5`. 
  * Обратите внимание, в "МБ/с" Б - это байт, а не бит.
  * Можно использовать `0` для небольшой пропускной способности.
* `downlinkCapacity`: Downlink bandwidth, in MB/s. The maximum bandwidth for the V2Ray instance to download data. Default value is `20`. 
  * Please note it is byte (in MB/s), not bit.
  * One may use value `0` for a small bandwidth.
* `congestion`: Whether or not to enable congestion control. Default value is `false`. 
  * When congestion control is enabled, V2Ray will detect network quality. It will send less packets when packet loss is severe, or more data when network is not fully filled.
* `readBufferSize`: Read buffer size for a single connection, in MB. Default value is `2`.
* `writeBufferSize`: Write buffer size for a single connection, in MB. Default value is `2`.
* `header`: Заголовок пакета для маскировки. 
  * `type`: Type of obfuscation. Choices are: 
    * `"none"`: Default value. No obfuscation is added.
    * `"srtp"`: Obfuscated as SRTP traffic. It may be recognized as video calls such as Facetime.
    * `"utp"`: Obfuscated as uTP traffic. It may be recognized as Bittorrent traffic.
    * `"wechat-video"`: Маскировка под WeChat.
    * `"dtls"`: Маскировка под пакеты DTLS 1.2.
    * `"wireguard"` (V2Ray 3.38+): Obfuscated as WireGuard packets. (NOT true WireGuard protocol)

## Замечания {#tips}

* `uplinkCapacity` и `downlinkCapacity` определяют скорость mKCP. На стороне клиента `uplinkCapacity` устанавливает скорость отправки данных на сервер. На стороне сервера `downlinkCapacity` устанавливает скорость получения данных сервером. Реальная скорость будет определяться наименьшим значением.
* mKCP uses UDP protocol. Please make sure your firewall is correctly setup.
* mKCP sends more traffic for lower latency. To transfer the same amount of data, mKCP usually requires more throughput than TCP does.

## Благодарности {#credits}

* @skywind3000 создал оригинальный протокол KCP и воплотил его на C.
* @xtaci реализовал KCP на Go.
* @xiaokangwang встроил KCP в V2Ray.