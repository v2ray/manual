# Принцип работы

![Английский](../resources/englishc.svg) [![Китайский](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/workflow.html)

## Одиночный сервер

Как и в случае с другими прокси, вам нужен прокси-сервер, с запущенным V2Ray. Вы можете подключаться к Интернету через этот сервер с ПК, мобильных и других устройств.

![direct](../resources/direct.png)

V2Ray поддерживает соединения с нескольких устройств с различными протоколами одновременно. В то же время механизм локальной маршрутизации может грамотно проксировать только необходимые соединения.

## Server Bridge

In the case you don't want configuration V2Ray on each of your devices, you may setup a server within the firewall, and then all traffic go through that server. The server does routing itself.

![relay](../resources/relay.png)

## Internal

The internal of V2Ray looks like below. It supports multiple inbound proxies, and multiple outbounds. Each of them are independent from others.

![internal](../resources/internal.svg)

Notes:

* You have to configure at least one inbound and one outbound to make V2Ray work properly.
* The inbound proxy communicates with client software such as browser.
* The outbound proxy communicates with remote server, such as Apache for a website.
* The dispatcher is responsible for choosing a outbound for a given connection, based on configurable rules.

Detailed configuration can be found [here](../configuration/overview.md).