---
refcn: chapter_02/transport/domainsocket
refen: configuration/transport/domainsocket
---
# Доставка через сокет домена

Сокет домена использует стандартный сокет домена Unix для доставки данных. Сокет домена - это внутрисистемный канал передачи данных. Он не создаёт задержек в сетевом буфере и может быть немного быстрее, чем передача через локальную петлю (loopback).

Сокет домена может использоваться только на платформах, которые его поддерживают: Unix, macOS и Linux. ОС Windows не поддерживается.

{% hint style='info' %} When domain socket is used, IP and port specified on the inbound/outbound proxy will be ignored. All traffic is tunneled through the domain socket. {% endhint %}

## DomainSocketObject

`DomainSocketObject` is used in `dsSettings` field in `TransportObject` and `StreamSettingsObject`.

```javascript
{
  "path": "/path/to/ds/file"
}
```

> `path`: string

An valid absolute file path. Before running V2Ray, the file on this path must not exist.