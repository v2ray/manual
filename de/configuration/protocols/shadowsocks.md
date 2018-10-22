---
refcn: chapter_02/protocols/shadowsocks
refen: configuration/protocols/shadowsocks
---
# Shadowsocks

[Shadowsocks](https://www.shadowsocks.org/) Protokoll für ein- und ausgehende Verbindungen.

Kompatibilität mit der offiziellen Version:

* Unterstützt sowohl TCP- als auch UDP-Verbindungen, wobei UDP optional deaktiviert sein kann.
* Supports [OTA](https://web.archive.org/web/20161221022225/https://shadowsocks.org/en/spec/one-time-auth.html)； 
  * Der Kunde kann wählen, ob er ein- oder ausschaltet.
  * Der Server kann aktivieren, deaktivieren oder automatisch auswählen.
* Encryption methods ([AEAD](https://shadowsocks.org/en/spec/AEAD-Ciphers.html) ciphers added in V2Ray 3.0): 
  * aes-256-cfb
  * aes-128-cfb
  * chacha20
  * chacha20-ietf
  * aes-256-gcm
  * aes-128-gcm
  * chacha20-poly1305 alias chacha20-ietf-poly1305
* Plugins: 
  * Unterstützen Sie obfs im Standalone-Modus.

Info:

* Name: Schattensocken
* Type: Inbound / Outbound

## Inbound-Proxy-Konfiguration

```javascript
{
  "email": "love@v2ray.com",
  "method": "aes-128-cfb",
  "password": "password",
  "udp": false,
  "level": 0,
  "ota": true,
  "network": "tcp"
}
```

Wo:

* `email`: Email address. Used for user identification.
* `Methode`: Encryption method. No default value. Options are: 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` oder `"chacha20-ietf-poly1305"`
* `password`: Password. Can be any string.
* `udp` (Deprecated, use `network`): `true` or `false`, whether or not to enable UDP. Default to `false`.
* `level`: User level. Default to `0`. See [Policy](../policy.md).
* `ota`: `true` or `false`, whether or not to enable OTA. 
  * Wenn AEAD verwendet wird, `OTA` hat keine Auswirkung.
  * When this entry is not specified at all, Shadowsocks inbound detects client settings and then act accordingly.
  * When this is set to `true` (or `false`) but client is set in the other way, Shadowsocks inbound disconnects connection immediately.
* `network`: Type of network, either `"tcp"`, `"udp"`, or `"tcp,udp"`. Default to `"tcp"`.

## Outbound-Proxy-Konfiguration

```javascript
{"Server": [{"email": "love@v2ray.com", "Adresse": "127.0.0.1", "Port": 1234, "Methode": "Methode", "Passwort": "Passwort" , "ota": falsch, "level": 0}]}
```

Wo:

* `email`: Email address. Used for user identification.
* `address`: Address of Shadowsocks server. Can be IPv4, IPv6 or domain.
* `Port`: Port des Shadowsocks-Servers.
* `method`: Encryption method. No default value. Options are: 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` or `"chacha20-ietf-poly1305"`
* `password`: Password. Can be any string.
* `ota`: Ob OTA verwendet werden soll oder nicht. 
  * When AEAD is used, `ota` has no effect.
* `level`: Benutzerebene.