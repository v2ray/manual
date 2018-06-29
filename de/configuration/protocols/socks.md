# Socken

![Englisch](../../resources/englishc.svg) [![Chinesisch](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/socks.html)

Socks ist eine Implementierung des Standard-SOCKS-Protokolls, kompatibel mit [Socks 4](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol), Socks 4a und [Socks 5](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol).

* Name: Socken
* Geben Sie ein: Eingehend / Ausgehend

## Outbound-Proxy-Konfiguration

```javascript
{
  "servers": [{
    "address": "127.0.0.1",
    "port": 1234,
    "users": [
      {
        "user": "test user",
        "pass": "test pass",
        "level": 0
      }
    ]
  }]
}
```

Woher:

* `servers`: Socks Server Liste, in der jeder Eintrag hat: 
  * `address`: Serveradresse
  * `port`: Server-Port
  * `users`: Liste der Benutzerkonten: 
    * `user`: Benutzername
    * `pass`: Passwort
    * `level`: Benutzerebene.

Beachten:

* Wenn die Benutzerliste nicht leer ist, führt Socks eine Benutzerauthentifizierung mit dem Remoteserver unter Verwendung eines zufälligen Benutzers durch.
* Unterstützt nur SOCKS5-Server.

## Eingehende Proxy-Konfiguration

```javascript
{
  "auth": "noauth",
  "accounts": [
    {
      "user": "my-username",
      "pass": "my-password"
    }
  ],
  "udp": false,
  "ip": "127.0.0.1",
  "userLevel": 0
}
```

Wo:

* `auth`: Socken Authentifizierungsmethode. Standard auf `"noauth"`. Optionen sind: 
  * `"noauth"`: Anonym.
  * `"Passwort"`: Benutzer und Passwort [RFC 1929](https://tools.ietf.org/html/rfc1929)
* `accounts`: Ein Array, in dem jeder Eintrag `user` für Benutzername und `pass` für Kennwort enthält. Standard bis leer 
  * Funktioniert nur, wenn `auth` ist `"password"`
* `udp`: `true` oder `false` um UDP zu aktivieren. Standard auf falsch.
* `ip`: Wenn UDP aktiviert ist, empfängt diese IP-Adresse UDP-Pakete vom Client. Standard auf `"127.0.0.1"`.
* `userLevel`: Benutzerebene. Alle Verbindungen teilen diese Ebene.