---
refcn: chapter_02/reverse
refen: configuration/reverse
---
# Reverse Proxy

Reverse proxy is an optional feature in V2Ray. It redirects traffic from a server to a client. Thus is so called "Reverse" proxying.

{% hint style='tip' %}

Reverse proxy is available in V2Ray 4.0+. It is now in beta, and may be improved in near future.

{% endhint %}

Reverse proxy works in the following way:

* Suppose there is a device A that runs a web server. Device A has no public IP address, and can't be accessed from internet. There is another device B, say a cloud server, which can be access from internet. We need to use B as portal, to redirect traffice to A.
* Now we install a V2Ray on device A, named `bridge`. And then install a V2Ray on device B, named `portal`.
* `bridge` will open connections to `portal`. Their target can be customized for routing purpose. `portal` will receive these connections, as well as connections from other uses in the internet. `portal` will "connect" these two kind of connections. Then the interent traffic will be tunneled to `bridge`.
* After `bridge` receives traffic from internet through `portal`, it will send these traffic to the web server on localhost. You may configure routing for these traffic as well.
* `bridge` will control load balance based of the amount of traffic.

{% hint style='danger' %}

Reverse proxy has already leveraged [Mux](mux.md). It is not necessary to configure Mux again on its outbound.

{% endhint %}

## ReverseObject

`ReverseObject` is used as `reverse` field in top level configuration.

```javascript
{
  "bridges": [{
    "tag": "bridge",
    "domain": "test.v2ray.com"
  }],
  "portals": [{
    "tag": "portal",
    "domain": "test.v2ray.com"
  }]
}
```

> `bridges`: \[[BridgeObject](bridgeobject)\]

An array of `bridge`s. Each `bridge` is a [BridgeObject](bridgeobject).

> `portals`: \[[PortalObject](portalobject)\]

An array of `portal`s. Each `portal` is a [PortalObject](bridgeobject).

### BridgeObject

```javascript
{
  "tag": "bridge",
  "domain": "test.v2ray.com"
}
```

> `tag`: string

A tag. All traffic initiated by this `bridge` will have this tag. It can be used for [routing](routing.md), identified as `inboundTag`.

> `domain`: string

A domain. All connections initiated by `bridge` towards `portal` will use this domain as target. This domain is only used for communication between `bridge` and `portal`. It is not necessary to be actually registered.

### PortalObject

> `tag`: string

A Tag. You need to redirect all traffic to this `portal`, by targeting `outboundTag` to this `tag`. The traffic includes the connections from `bridge`, as well as internet traffic.

> `domain`: string

A domain. When a connection targeting this domain, `portal` considers it is a connection from `bridge`, otherwise it is an internet connection.

{% hint style='tip' %}

Like other usages, a V2Ray instance can be used as a `bridge`, or a `portal`, or both as the same time.

{% endhint %}

## Example configuration

`bridge` usually needs two outbounds. One for connecting `portal`, and another for connecting local web server.

Reverse:

```javascript
{
  "bridges": [{
    "tag": "bridge",
    "domain": "test.v2ray.com"
  }]
}
```

Outbound:

```javascript
{
  "tag": "out"
  "protocol": "freedom",
  "settings": {
    "redirect": "127.0.0.1:80" // Send traffic to local web server
  }
},
{
  "protocol": "vmess",
  "settings": {
    "vnext": [{
      "address": "portal的IP地址",
      "port": 1024,
      "users": [{"id": "27848739-7e62-4138-9fd3-098a63964b6b"}]
    }]
  },
  "tag": "interconn"
}
```

Routing:

```javascript
"routing": {
  "strategy": "rules",
  "settings": {
    "rules": [{
      "type": "field",
      "inboundTag": ["bridge"],
      "domain": ["full:test.v2ray.com"],
      "outboundTag": "interconn"
    },{
      "type": "field",
      "inboundTag": ["bridge"],
      "outboundTag": "out"
    }]
  }
}
```

`portal` usually needs two inbounds. One for connections from `bridge`, and another for internet connections.

Reverse:

```javascript
{
  "portals": [{
    "tag": "portal",
    "domain": "test.v2ray.com"  // Must be the same as in bridge
  }]
}
```

Inbound:

```javascript
{
  "tag": "external",
  "port": 80,  // Open port 80 for internet HTTP traffic
  "protocol": "dokodemo-door",
  "settings": {
    "address": "127.0.0.1",
    "port": 80,
    "network": "tcp"
  }
},
{
  "port": 1024, // For bridge connections
  "tag": "interconn",
  "protocol": "vmess",
  "settings": {
    "clients": [{"id": "27848739-7e62-4138-9fd3-098a63964b6b"}]
  }
}
```

Routing:

```javascript
"routing": {
  "strategy": "rules",
  "settings": {
    "rules": [{
      "type": "field",
      "inboundTag": ["external"],
      "outboundTag": "portal"
    },{
      "type": "field",
      "inboundTag": ["interconn"],
      "outboundTag": "portal"
    }]
  }
}
```

{% hint style='tip' %}

In practice, you may want to run `bridge` first and then `portal`.

{% endhint %}