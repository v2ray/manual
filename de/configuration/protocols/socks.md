# Socken

![Englisch](../../resources/englishc.svg) [![Chinesisch](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/socks.html)

Socks ist eine Implementierung des Standard-SOCKS-Protokolls, kompatibel mit [Socks 4](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol), Socks 4a und [Socks 5](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol).

* Name: Socken
* Geben Sie ein: Eingehend / Ausgehend

## Outbound-Proxy-Konfiguration

```javascript
{"Server": [{"Adresse": "127.0.0.1", "Port": 1234, "Benutzer": [{"user": "test user", "pass": "test pass", "level" : 0}]}]}
```

Woher:

* `Server`: Socks Server Liste, in der jeder Eintrag hat: 
  * `Adresse`: Serveradresse
  * `Port`: Server-Port
  * `Benutzer`: Liste der Benutzerkonten: 
    * `Benutzer`: Benutzername
    * `Pass`: Passwort
    * `Stufe`: Benutzerebene.

Beachten:

* Wenn die Benutzerliste nicht leer ist, führt Socks eine Benutzerauthentifizierung mit dem Remoteserver unter Verwendung eines zufälligen Benutzers durch.
* Unterstützt nur SOCKS5-Server.

## Eingehende Proxy-Konfiguration

```javascript
{"auth": "noauth", "Konten": [{"user": "mein-Benutzername", "pass": "mein-Passwort"}], "udp": false, "ip": "127.0. 0.1 "," userLevel ": 0}
```

Where:

* `autorisiert`: Socken Authentifizierungsmethode. Standard auf `"noauth"`. Optionen sind: 
  * `"noauth"`: Anonym.
  * `"Passwort"`: Benutzer und Passwort [RFC 1929](https://tools.ietf.org/html/rfc1929)
* `Konten`: Ein Array, in dem jeder Eintrag `Benutzer` für Benutzername und `Pass` für Kennwort enthält. Standard bis leer 
  * Funktioniert nur, wenn `Auth` `"Passwort"`
* `udp`: `wahr` oder `falsch` um UDP zu aktivieren. Standard auf falsch.
* `ip`: Wenn UDP aktiviert ist, empfängt diese IP-Adresse UDP-Pakete vom Client. Standard auf `"127.0.0.1"`.
* `userLevel`: Benutzerebene. Alle Verbindungen teilen diese Ebene.