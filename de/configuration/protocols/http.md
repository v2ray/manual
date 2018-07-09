# HTTP

[![English](../../resources/english.svg)](https://www.v2ray.com/en/configuration/protocols/http.html) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/http.html) [![German](../../resources/german.svg)](https://www.v2ray.com/de/configuration/protocols/http.html) [![Russian](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/protocols/http.html)

HTTP is a protocol for inbound connections. Es ist kompatibel mit HTTP 1.1.

* Name: http
* Typ: Eingehend
* Aufbau:

```javascript
{"accounts": [{"user": "mein-Benutzername", "pass": "mein-Passwort"}], "allowTransparent": false, "userLevel": 0}
```

Woher:

* `Konten`: Ein Array, in dem jeder Eintrag ein Account ist. Der Benutzername des Accounts wird mit `Benutzer`und das Passwort mit `Pass`. Standard leer 
  * Wenn `Konten` nicht leer ist, verwendet HTTP die Standardauthentifizierung für die Benutzerüberprüfung.
* `allowTransparent`: Wenn `wahr`, werden alle HTTP-Anfragen, die an diesen eingehenden Empfänger gesendet werden, einschließlich Nicht-Proxy-Anfragen, weitergeleitet.
* `userLevel`: Benutzerebene. Alle Verbindungen teilen diese Ebene.

## Tipps

Verwenden Sie die folgenden Einstellungen unter Linux, um den HTTP-Proxy in der aktuellen Sitzung zu verwenden.

* `export http_proxy = http: //127.0.0.1: 8080/` (URL hat nach der Config ändern)
* `export https_proxy =$http_proxy`