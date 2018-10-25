---
refcn: chapter_00/workflow
refen: welcome/workflow
---
# Workflow

## Einzelner Server

Same as other proxies, you need a proxy server which runs V2Ray. Then you can connect to internet through that server from you PC, mobile or other devices.

![Direkte](../resources/direct.png)

V2Ray supports connections from multiple devices at the same time, with optionally different protocols. In the mean time, the local routing mechanism can smartly proxy necessary connections only.

## Serverbrücke

In the case you don't want configuration V2Ray on each of your devices, you may setup a server within the firewall, and then all traffic go through that server. The server does routing itself.

![Relais](../resources/relay.png)

## Intern

The internal of V2Ray looks like below. It supports multiple inbound proxies, and multiple outbounds. Each of them are independent from others.

![intern](../resources/internal.svg)

Anmerkungen:

* Sie müssen mindestens einen Eingang und einen Ausgang konfigurieren, damit V2Ray ordnungsgemäß funktioniert.
* Der eingehende Proxy kommuniziert mit einer Client-Software wie einem Browser.
* Der Outbound-Proxy kommuniziert mit dem Remote-Server, z. B. Apache, für eine Website.
* Der Dispatcher ist verantwortlich für die Auswahl eines Ausgangs für eine bestimmte Verbindung basierend auf konfigurierbaren Regeln.

Detaillierte Konfiguration kann hier gefunden werden [hier](../configuration/overview.md).