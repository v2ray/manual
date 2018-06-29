# VMess

[VMess](https://www.v2ray.com/eng/protocols/vmess.html) ist ein Protokoll für verschlüsselte Kommunikation. Es umfasst sowohl den eingehenden als auch den ausgehenden Proxy.

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
          "alterId": 10,
          "security": "aes-128-cfb",
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
    * `alterId`: Anzahl der alternativen IDs. Die alternativen IDs werden deterministisch generiert. Standard auf 0. Maximal 65535. Empfehle 32.
    * `level`: Benutzerebene. Weitere Sie unter [ Richtlinie](../Policy.md).</li> 
      
      * `security`: Verschlüsselungsmethode Optionen sind: 
        * `"aes-128-cfb"`
        * `"aes-128-gcm"`: Empfohlen für PC.
        * `"chacha20-poly1305"`: Empfohlen für Mobilgeräte.
        * `"auto"`: Standardwert. Verwenden Sie andernfalls `aes-128-gcm` auf AMD64 und S390x oder `chacha20-poly1305`.
        * `"none"`: Der Verkehr ist überhaupt nicht verschlüsselt.</ul></li> </ul></li> </ul> 
      
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
      
      Wo:
      
      * `clients`: Ein Array für gültige Benutzerkonten. Kann leer sein, wenn es für die dynamische Portfunktion verwendet wird. 
        * Jeder Client enthält: 
          * `id`: Benutzer ID, in Form von [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).
          * `level`: User level. See [Policy](../policy.md) for its usage.
          * `alterId`: Number of alternative IDs. Same as in Inbound. Value must be the same as connecting clients.
          * `email`: Email address to identify users.
      * `detour`: Option, um dem Kunden einen Umweg zu empfehlen. 
        * `bis`: Das Tag eines eingehenden Proxy. Siehe [Übersicht](../02_protocols.md). Wenn konfiguriert, schlägt VMess dem Client vor, den Umweg für weitere Verbindungen zu verwenden.
      * `default`: Optionale Standard-Client-Konfiguration. Wird normalerweise im Umleitungs-Proxy verwendet. 
        * `level`: Benutzerebene.
        * `alterId`: Anzahl der alternativen IDs. Standardwert 64.
      * `disableInsecureEncryption`: Forbids client for using insecure encryption methods. Wenn der Wert auf "true" gesetzt ist, werden die Verbindungen sofort beendet, wenn die folgende Verschlüsselung verwendet wird. Standardwert `false`. 
        * `none`
        * `aes-128-cfb`
      
      ## Tipps
      
      * Verwenden Sie immer die Verschlüsselungsmethode `"auto"` , um sicher und kompatibel zu bleiben.
      * VMess ist abhängig von der Systemzeit. Bitte stellen Sie sicher, dass Ihre Systemzeit mit der UTC-Zeit übereinstimmt. Zeitzone spielt keine Rolle. 
        * Man kann den Dienst `ntp` unter Linux installieren, um die Systemzeit automatisch anzupassen.