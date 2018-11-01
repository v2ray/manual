---
refcn: chapter_02/protocols/http
refen: configuration/protocols/http
---
# HTTP

HTTP is a protocol for inbound connections. It is compatible with HTTP/1.1.

* Name: http
* Type: Inbound
* Konfiguration:

```javascript
{"accounts": [{"user": "mein-Benutzername", "pass": "mein-Passwort"}], "allowTransparent": false, "userLevel": 0}
```

Wo:

* `Konten`: An array in which each entry is an account. Username of the account is specified by `user`, and password specified by `pass`. Default empty. 
  * Wenn `Konten` nicht leer ist, verwendet HTTP die Standardauthentifizierung für die Benutzerüberprüfung.
* `allowTransparent`: Wenn `wahr`, werden alle HTTP-Anfragen, die an diesen eingehenden Empfänger gesendet werden, einschließlich Nicht-Proxy-Anfragen, weitergeleitet.
* `userLevel`: User level. All connections share this level.

## Tips

Verwenden Sie die folgenden Einstellungen unter Linux, um den HTTP-Proxy in der aktuellen Sitzung zu verwenden.

* `export http_proxy = http: //127.0.0.1: 8080/` (URL hat nach der Config ändern)
* `export https_proxy =$http_proxy`