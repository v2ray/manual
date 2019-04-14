---
refcn: chapter_00/workflow
refen: welcome/workflow
---
# Workflow

## Single Server

Same as other proxies, you need a proxy server which runs V2Ray. Then you can connect to internet through that server from you PC, mobile or other devices.

```mermaid
graph LR;
A(PC) -.- B(Firewall);
B -.-> C(Blocked Website);
A --> D(V2Ray/VPS);
D --> C;
A --> E(Normal Website);
```

V2Ray supports connections from multiple devices at the same time, with optionally different protocols. In the mean time, the local routing mechanism can smartly proxy necessary connections only.

## Server Bridge

In the case you don't want configuration V2Ray on each of your devices, you may setup a server within the firewall, and then all traffic go through that server. The server does routing itself.

```mermaid
graph LR;
A(PC) -.-> B(Firewall);
B -.-> C(Blocked Website);
A --> D(VPS 1);
D --> E(VPS 2);
E --> C;
D --> F(Normal Website);
```

## Internal

The internal of V2Ray looks like below. It supports multiple inbound proxies, and multiple outbounds. Each of them are independent from others.

```mermaid
graph LR;
A1(inbound) --> D(Dispatcher / Router / DNS);
A2(inbound) --> D;
A3(inbound) --> D;
A4(inbound) --> D;
D --> B1(outbound);
D --> B2(outbound);
D --> B3(outbound);
D --> B4(outbound);
```

Notes:

* You have to configure at least one inbound and one outbound to make V2Ray work properly.
* The inbound proxy communicates with client software such as browser.
* The outbound proxy communicates with remote server, such as Apache for a website.
* The dispatcher is responsible for choosing a outbound for a given connection, based on configurable rules.

Detailed configuration can be found [here](../configuration/overview.md).