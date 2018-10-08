# VMess

[![English](../../resources/english.svg)](https://www.v2ray.com/en/configuration/protocols/vmess.html) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/vmess.html) [![German](../../resources/german.svg)](https://www.v2ray.com/de/configuration/protocols/vmess.html) [![Russian](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/protocols/vmess.html)

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

Wo:

* `vnext`: Ein Array, bei dem jeder Eintrag ein Remote-Server ist 
  * `Adresse`: Serveradresse, möglicherweise IPv4, IPv6 oder Domänenname.
  * `port`: Server-Port
  * `users`: Ein Array, bei dem jeder Eintrag ein VMess-Benutzer ist 
    * `id`: Benutzer-ID in Form einer [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * `alterId`: Anzahl der alternativen IDs. Die alternativen IDs werden deterministisch generiert. Standard auf 0. Maximal 65535. Recommend 16. Its value must be not larger than the one in corresponding Inbound.
    * `level`: Benutzerebene. See [Policy](../policy.md) for more detail.
    * `security`: Verschlüsselungsmethode Optionen sind: 
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

Where:

* `clients`: Ein Array für gültige Benutzerkonten. Kann leer sein, wenn es für die dynamische Portfunktion verwendet wird. 
  * Jeder Client enthält: 
    * `id`: Benutzer ID, in Form von [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * `level`: User level. See [Policy](../policy.md) for its usage.
    * `alterId`: Number of alternative IDs. Same as in Outbound.
    * `email`: Email address to identify users.
* `detour`: Option, um dem Kunden einen Umweg zu empfehlen. 
  * `bis`: Das Tag eines eingehenden Proxy. See [Overview](../protocols.md). Wenn konfiguriert, schlägt VMess dem Client vor, den Umweg für weitere Verbindungen zu verwenden.
* `default`: Optionale Standard-Client-Konfiguration. Wird normalerweise im Umleitungs-Proxy verwendet. 
  * `level`: Benutzerebene.
  * `alterId`: Anzahl der alternativen IDs. Standardwert 64. Recommend 16.
* `disableInsecureEncryption`: Forbids client for using insecure encryption methods. Wenn der Wert auf "true" gesetzt ist, werden die Verbindungen sofort beendet, wenn die folgende Verschlüsselung verwendet wird. Standardwert `false`. 
  * `none`

## Tipps

* Verwenden Sie immer die Verschlüsselungsmethode `"auto"` , um sicher und kompatibel zu bleiben.
* VMess ist abhängig von der Systemzeit. Bitte stellen Sie sicher, dass Ihre Systemzeit mit der UTC-Zeit übereinstimmt. Zeitzone spielt keine Rolle. 
  * Man kann den Dienst `ntp` unter Linux installieren, um die Systemzeit automatisch anzupassen.
* You may choose the value of `alterId` at your interest. For daily usage, a value less than `100` is usually enough.