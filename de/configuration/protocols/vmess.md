# VMess

[VMess](https://www.v2ray.com/eng/protocols/vmess.html) ist ein Protokoll für verschlüsselte Kommunikation. Es umfasst sowohl den eingehenden als auch den ausgehenden Proxy.

* Name: vmess
* Geben Sie ein: Eingehend / Ausgehend

## Outbound-Proxy-Konfiguration

```javascript
{"vnext": [{"adresse": "127.0.0.1", "port": 37192, "benutzer": [{"id": "27848739-7e62-4138-9fd3-098a63964b6b", "alterId": 10 , "Sicherheit": "aes-128-cfb", "level": 0}]}]}
```

Woher:

* `vnext`: Ein Array, bei dem jeder Eintrag ein Remote-Server ist 
  * `Adresse`: Serveradresse, möglicherweise IPv4, IPv6 oder Domänenname.
  * `Port`: Server-Port
  * `Benutzer`: Ein Array, bei dem jeder Eintrag ein VMess-Benutzer ist 
    * `ID`: Benutzer-ID in Form einer [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * `alterId`: Anzahl der alternativen IDs. Die alternativen IDs werden deterministisch generiert. Standard auf 0. Maximal 65535. Empfehle 32.
    * `Stufe`: Benutzerebene. Weitere Sie unter [ Richtlinie](../Policy.md).</li> 
      
      * `Sicherheit`: Verschlüsselungsmethode Optionen sind: 
        * `"aes-128-cfb"`
        * `"aes-128-gcm"`: Empfohlen für PC.
        * `"chacha20-poly1305"`: Empfohlen für Mobilgeräte.
        * `"auto"`: Standardwert. Verwenden Sie andernfalls `aes-128-gcm` auf AMD64 und S390x oder `chacha20-poly1305`.
        * `"keine"`: Der Verkehr ist überhaupt nicht verschlüsselt.</ul></li> </ul></li> </ul> 
      
      ## Eingehende Proxy-Konfiguration
      
      ```javascript
      {"clients": [{"id": "27848739-7e62-4138-9fd3-098a63964b6b", "level": 0, "alterId": 100, "email": "love@v2ray.com"}], " Standard ": {" level ": 0," alterId ": 32}," Umleitung ": {" to ":" tag_to_detour "}," disableInsecureEncryption ": false}
      ```
      
      ::
      
      * `Kunden`: Ein Array für gültige Benutzerkonten. Kann leer sein, wenn es für die dynamische Portfunktion verwendet wird. 
        * Jeder Client enthält: 
          * `ID`: Benutzer ID, in Form von [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).
          * `Stufe`: Benutzerebene. Siehe [Policy](../policy.md) * `alterId`: Anzahl der alternativen IDs. Wie in Inbound. Der Wert muss mit dem des Clients übereinstimmen.
          * `E-Mail`: E-Mail-Adresse, um Benutzer zu identifizieren.
      * `Umleitung`: Option, um dem Kunden einen Umweg zu empfehlen. 
        * `bis`: Das Tag eines eingehenden Proxy. Siehe [Übersicht](../02_protocols.md). Wenn konfiguriert, schlägt VMess dem Client vor, den Umweg für weitere Verbindungen zu verwenden.
      * `Standard`: Optionale Standard-Client-Konfiguration. Wird normalerweise im Umleitungs-Proxy verwendet. 
        * `Stufe`: Benutzerebene.
        * `alterId`: Anzahl der alternativen IDs. Standardwert 64.
      * `disableInsecureEncryption` (V2Ray 3.11+): Verbietet dem Client die Verwendung von unsicheren Verschlüsselungsmethoden. Wenn der Wert auf "true" gesetzt ist, werden die Verbindungen sofort beendet, wenn die folgende Verschlüsselung verwendet wird. Standardwert `false`. 
        * `keiner`
        * `aes-128-cfb`
      
      ## Tipps
      
      * Verwenden Sie immer die Verschlüsselungsmethode `"auto"` , um sicher und kompatibel zu bleiben.
      * VMess ist abhängig von der Systemzeit. Bitte stellen Sie sicher, dass Ihre Systemzeit mit der UTC-Zeit übereinstimmt. Zeitzone spielt keine Rolle. 
        * Man kann den Dienst `ntp` unter Linux installieren, um die Systemzeit automatisch anzupassen.