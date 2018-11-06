---
refcn: chapter_02/protocols/vmess
refen: configuration/protocols/vmess
---
# VMess

* Name: `vmess`
* Type: Inbound / Outbound

[VMess](https://www.v2ray.com/eng/protocols/vmess.html) is a protocol for encrypted communications. It includes both inbound and outbound proxy.

VMess depends on system time. Please ensure that your system time is in sync with UTC time. Timezone doesn't matter. One may install `ntp` service on Linux to automatically adjust system time.

## OutboundConfigurationObject

```javascript
{
  "vnext": [
    {
      "address": "127.0.0.1",
      "port": 37192,
      "users": [
        {
          "id": "27848739-7e62-4138-9fd3-098a63964b6b",
          "alterId": 16,
          "security": "auto",
          "level": 0
        }
      ]
    }
  ]
}
```

> `vnext`: \[ [ServerObject](#serverobject) \]

An array, where each element presents a remote server

### ServerObject

```javascript
{
  "address": "127.0.0.1",
  "port": 37192,
  "users": []
}
```

> `address`: address

Server address, may be IPv4, IPv6 or domain name.

> `port`: number

Server port

> `users`: \[ [UserObject](#userobject) \]

An array where each element is an VMess user

### UserObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "alterId": 16,
  "security": "auto",
  "level": 0
}
```

> `id`: string

User ID, in the form of a [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).

> `alterId`: number

Number of alternative IDs. The alternative IDs will be generated in a deterministic way. Default to 0. Maximum 65535. Recommend 16. Its value must be not larger than the one in corresponding Inbound.

> `level`: number

User level. See [Policy](../policy.md) for more detail.

> `security`: "aes-128-gcm" | "chacha20-poly1305" | "auto" | "none"

Method for encrypting payload. This setting is only available at outbound. The VMess inbound will automatically recognize this setting and decrypt payload accordingly. Options are:

* `"aes-128-gcm"`: Recommended for PC.
* `"chacha20-poly1305"`: Recommended for mobile.
* `"auto"`: Default value. Use `aes-128-gcm` on AMD64, ARM64 and S390x, or `chacha20-poly1305` otherwise.
* `"none"`: Der Verkehr ist überhaupt nicht verschlüsselt.

{% hint style='info' %}

Use `"auto"` wherever possible for better compatibility.

{% endhint %}

## InboundConfigurationObject

```javascript
{
  "clients": [
    {
      "id": "27848739-7e62-4138-9fd3-098a63964b6b",
      "level": 0,
      "alterId": 100,
      "email": "love@v2ray.com"
    }
  ],
  "default": {
    "level": 0,
    "alterId": 32
  },
  "detour": {
    "to": "tag_to_detour"
  },
  "disableInsecureEncryption": false
}
```

> `clients`: \[ [ClientObject](#clientobject) \]

An array for valid user accounts. May be empty when used for dynamic port feature.

> `detour`: [DetourObject](#detourobject)

Optional feature to suggest client to take a detour. If specified, this inbound will instruct the outbound to use another inbound.

> `default`: [DefaultObject](#defaultobject)

Optional default client configuration. Usually used with `detour`.

> `disableInsecureEncryption`: true | false

Forbids client for using insecure encryption methods. When set to `true`, connections will be terminated immediately if the following encryption is used. Default value `false`.

* `none`
* `aes-128-cfb`

### ClientObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "level": 0,
  "alterId": 16,
  "email": "love@v2ray.com"
}
```

> `id`: string

User ID, in the form of [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).

> `level`: number

User level. See [Policy](../policy.md) for its usage.

> `alterId`: number

Number of alternative IDs. Same as in Outbound.

> `email`: string

Email address for user identification.

### DetourObject

```javascript
{
  "to": "tag_to_detour"
}
```

> `to`: string

The tag of an inbound proxy. See [Overview](../protocols.md). If configured, VMess will suggest its client to use the detour for further connections.

### DefaultObject

```javascript
{
  "level": 0,
  "alterId": 32
}
```

> `level`: number

User level.

> `alterId`: number

Number of alternative IDs. Default value 64. Recommend 16.