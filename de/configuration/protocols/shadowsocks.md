* * *

refcn: chapter_02/protocols/shadowsocks refen: configuration/protocols/shadowsocks

* * *

# Shadowsocks

[Shadowsocks](https://www.shadowsocks.org/) Protokoll für ein- und ausgehende Verbindungen.

Kompatibilität mit der offiziellen Version:

* Unterstützt sowohl TCP- als auch UDP-Verbindungen, wobei UDP optional deaktiviert sein kann.
* Unterstützt [OTA](https://web.archive.org/web/20161221022225/https://shadowsocks.org/en/spec/one-time-auth.html); 
  * Der Kunde kann wählen, ob er ein- oder ausschaltet.
  * Der Server kann aktivieren, deaktivieren oder automatisch auswählen.
* Verschlüsselungsmethoden ([AEAD](https://shadowsocks.org/en/spec/AEAD-Ciphers.html) Verschlüsselungen in V2Ray 3.0 hinzugefügt): 
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
* Geben Sie ein: Eingehend / Ausgehend

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

Where:

* `E-Mail`: E-Mail-Adresse. Wird zur Benutzeridentifikation verwendet.
* `Methode`: Verschlüsselungsmethode Kein Standardwert Optionen sind: 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` oder `"chacha20-ietf-poly1305"`
* `Passwort`: Passwort. Kann eine beliebige Zeichenfolge sein.
* `udp` (Veraltet, benutze `Netzwerk`): `true` oder `false`, ob UDP aktiviert werden soll oder nicht. Standardwert auf `false`.
* `Stufe`: Benutzerebene. Standard auf `0`. Siehe [Richtlinie](../policy.md).
* `ota`: `true` or `false`, whether or not to enable OTA. 
  * Wenn AEAD verwendet wird, `OTA` hat keine Auswirkung.
  * When this entry is not specified at all, Shadowsocks inbound detects client settings and then act accordingly.
  * When this is set to `true` (or `false`) but client is set in the other way, Shadowsocks inbound disconnects connection immediately.
* `network`: Type of network, either `"tcp"`, `"udp"`, or `"tcp,udp"`. Standard auf `"tcp"`.

## Outbound-Proxy-Konfiguration

```javascript
{"Server": [{"email": "love@v2ray.com", "Adresse": "127.0.0.1", "Port": 1234, "Methode": "Methode", "Passwort": "Passwort" , "ota": falsch, "level": 0}]}
```

Where:

* `E-Mail`: E-Mail-Adresse. Wird zur Benutzeridentifikation verwendet.
* `Adresse`: Adresse des Shadowsocks-Servers. Kann IPv4, IPv6 oder Domäne sein.
* `Port`: Port des Shadowsocks-Servers.
* `Methode`: Verschlüsselungsmethode Kein Standardwert Optionen sind: 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` oder `"chacha20-ietf-poly1305"`
* `Passwort`: Passwort. Kann eine beliebige Zeichenfolge sein.
* `ota`: Ob OTA verwendet werden soll oder nicht. 
  * Wenn AEAD verwendet wird, `OTA` hat keine Auswirkung.
* `Stufe`: Benutzerebene.