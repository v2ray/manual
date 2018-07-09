# Statistics

[![English][1]][2] [![Chinese][3]][4] [![German][5]][6] [![Russian][7]][8]

[1]: ../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/stats.html
[3]: ../resources/chinese.svg
[4]: https://www.v2ray.com/chapter_02/stats.html
[5]: ../resources/german.svg
[6]: https://www.v2ray.com/de/configuration/stats.html
[7]: ../resources/russian.svg
[8]: https://www.v2ray.com/ru/configuration/stats.html

V2Ray provides some information about its internals.

Configuration:

```javascript
{
}
```

All stats counters are listed below:

* `user>>>[email]>>>traffic>>>uplink` (V2Ray 3.16+): Accumulated uplink traffic of specific user, in bytes.
* `user>>>[email]>>>traffic>>>downlink` (V2Ray 3.16+): Accumulated downlink traffic of specific user, in bytes.
* `inbound>>>[tag]>>>traffic>>>uplink` (V2Ray 3.18+): Accumulated uplink traffic of specific inbound, in bytes.
* `inbound>>>[tag]>>>traffic>>>downlink` (V2Ray 3.18+): Accumulated downlink traffic of specific inbound, in bytes.

## Tips

* If a user doesn't have a valid email address, the stats will not be enabled.
