---
refcn: chapter_02/protocols/socks
refen: configuration/protocols/socks
---
# Socks

Socks ist eine Implementierung des Standard-SOCKS-Protokolls, kompatibel mit [Socks 4](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol), Socks 4a und [Socks 5](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol).

* Name: Socken
* Type: Inbound / Outbound

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

Wo:

* `servers`: Socks Server Liste, in der jeder Eintrag hat: 
  * `address`: Serveradresse
  * `port`: Server-Port
  * `users`: Liste der Benutzerkonten: 
    * `user`: Benutzername
    * `pass`: Passwort
    * `level`: Benutzerebene.

Notice:

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

* `auth`: Socks authentication method. Default to `"noauth"`. Options are: 
  * `"noauth"`: Anonym.
  * `"Passwort"`: Benutzer und Passwort [RFC 1929](https://tools.ietf.org/html/rfc1929)
* `accounts`: An array where each entry is contains `user` for username and `pass` for password. Default to empty. 
  * Funktioniert nur, wenn `auth` ist `"password"`
* `udp`: `true` or `false` to enable UDP. Default to false.
* `ip`: When UDP is enabled, this IP address receives UDP packets from client. Default to `"127.0.0.1"`.
* `userLevel`: User level. All connections share this level.