# Доставка через mKCP

[![Английский](../../resources/english.svg)](https://www.v2ray.com/en/configuration/transport/mkcp.html) [![Китайский](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/transport/mkcp.html) [![Немецкий](../../resources/german.svg)](https://www.v2ray.com/de/configuration/transport/mkcp.html) [![Русский](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/transport/mkcp.html)

mKCP - это надежный потоковый протокол. Основан на UDP.

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
* `tti`: Transmission time interval, в миллисекундах. mKCP будет отправлять данные через указанный интервал. Рекомендуемое значение между `10` и `100`. По умолчанию `50`.
* `uplinkCapacity`: Ширина полосы исходящей линии, МБ/с. Максимальная пропускная способность для экземпляра V2Ray для выгрузки данных в Сеть. По умолчанию `5`. 
  * Обратите внимание, в "МБ/с" Б - это байт, а не бит.
  * Можно использовать `0` для небольшой пропускной способности.
* `downlinkCapacity`: Ширина полосы входящей линии, МБ/с. Максимальная пропускная способность для экземпляра V2Ray для загрузки данных из Сети. По умолчанию `20`. 
  * Обратите внимание, в "МБ/с" Б - это байт, а не бит.
  * Можно использовать `0` для небольшой пропускной способности.
* `congestion`: Whether or not to enable congestion control. Default value is `false`. 
  * When congestion control is enabled, V2Ray will detect network quality. It will send less packets when packet loss is severe, or more data when network is not fully filled.
* `readBufferSize`: Read buffer size for a single connection, in MB. Default value is `2`.
* `writeBufferSize`: Write buffer size for a single connection, in MB. Default value is `2`.
* `header`: Packet header for obfuscation. 
  * `type`: Type of obfuscation. Choices are: 
    * `"none"`: Default value. No obfuscation is added.
    * `"srtp"`: Obfuscated as SRTP traffic. It may be recognized as video calls such as Facetime.
    * `"utp"`: Obfuscated as uTP traffic. It may be recognized as Bittorrent traffic.
    * `"wechat-video"`: Obfuscated to WeChat traffic.
    * `"dtls"` (V2Ray 3.24+): Obfuscated as DTLS 1.2 packets.

## Tips {#tips}

* `uplinkCapacity` and `downlinkCapacity` determine the speed of mKCP. On client side, `uplinkCapacity` specifies the speed for client sending data to server. On sever side, `downlinkCapacity` specifies the speed of server receiving data. The minimum of this pair is effective in an actual connection.
* mKCP uses UDP protocol. Please make sure your firewall is correctly setup.
* mKCP sends more traffic for lower latency. To transfer the same amount of data, mKCP usually requires more throughput than TCP does.

## Благодарности {#credits}

* @skywind3000 создал оригинальный протокол KCP и воплотил его на C.
* @xtaci реализовал KCP на Go.
* @xiaokangwang встроил KCP в V2Ray.