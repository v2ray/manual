---
refcn: chapter_02/protocols/vmess
refen: configuration/protocols/vmess
---
# VMess

[VMess](https://www.v2ray.com/eng/protocols/vmess.html) is a protocol for encrypted communications. It includes both inbound and outbound proxy.

* Name: vmess
* Geben Sie ein: Eingehend / Ausgehend

## Outbound-Proxy-Konfiguration

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

Woher:

* `vnext`: Ein Array, bei dem jeder Eintrag ein Remote-Server ist 
  * `Adresse`: Serveradresse, möglicherweise IPv4, IPv6 oder Domänenname.
  * `port`: Server-Port
  * `users`: Ein Array, bei dem jeder Eintrag ein VMess-Benutzer ist 
    * `id`: Benutzer-ID in Form einer [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * `alterId`: Anzahl der alternativen IDs. Die alternativen IDs werden deterministisch generiert. Standard auf 0. Maximal 65535. Recommend 16. Its value must be not larger than the one in corresponding Inbound.
    * `level`: User level. See [Policy](../policy.md) for more detail.
    * `security`: Encryption method. Options are: 
      * `"aes-128-gcm"`: Recommended for PC.
      * `"chacha20-poly1305"`: Recommended for mobile.
      * `"auto"`: Default value. Use `aes-128-gcm` on AMD64, ARM64 and S390x, or `chacha20-poly1305` otherwise.
      * `"none"`: Traffic is not encrypted at all.

## Eingehende Proxy-Konfiguration

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

Woher:

* `clients`: An array for valid user accounts. May be empty when used for dynamic port feature. 
  * Jeder Client enthält: 
    * `id`: Benutzer ID, in Form von [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * `level`: User level. See [Policy](../policy.md) for its usage.
    * `alterId`: Number of alternative IDs. Same as in Outbound.
    * `email`: Email address to identify users.
* `detour`: Option, um dem Kunden einen Umweg zu empfehlen. 
  * `to`: The tag of an inbound proxy. See [Overview](../protocols.md). If configured, VMess will suggest its client to use the detour for further connections.
* `default`: Optional default client configuration. Usually used in detour proxy. 
  * `Stufe`: Benutzerebene.
  * `alterId`: Number of alternative IDs. Default value 64. Recommend 16.
* `disableInsecureEncryption`: Forbids client for using insecure encryption methods. When set to true, connections will be terminated immediately if the following encryption is used. Default value `false`. 
  * `none`
  * `aes-128-cfb`

## Tipps

* Verwenden Sie immer die Verschlüsselungsmethode `"auto"` , um sicher und kompatibel zu bleiben.
* VMess depends on system time. Please ensure that your system time is in sync with UTC time. Timezone doesn't matter. 
  * Man kann den Dienst `ntp` unter Linux installieren, um die Systemzeit automatisch anzupassen.
* You may choose the value of `alterId` at your interest. For daily usage, a value less than `100` is usually enough.