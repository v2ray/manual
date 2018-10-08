* * *

refcn: chapter_02/protocols/freedom refen: configuration/protocols/freedom

* * *

# Freedom

Freedom ist ein Protokoll für ausgehende Verbindungen. Es übergibt alle TCP- oder UDP-Verbindungen an ihre Ziele.

* Name: Freiheit
* Typ: Ausgehend
* Aufbau:

```javascript
{
  "domainStrategy": "AsIs",
  "redirect": "127.0.0.1:3366",
  "userLevel": 0
}
```

Woher:

* `domainStrategy`: Strategie für die Domain-Namensauflösung. Optionen sind: 
  * `"AsIs"`: Standard. Beheben Sie den Domänennamen nach System.
  * `"UseIP"`: Use [internal DNS](../dns.md) for domain name resolution.
* `redirect`: Redirect all connections to this address, in form like `"127.0.0.1:80"` or `":1234"`. 
  * When address is empty, e.g. `":443"`, Freedom will use the original destination address.
  * When port is `0`, e.g. `"v2ray.com:0"`, Freedom will use the original port.
* `userLevel`: Benutzerebene. Alle Verbindungen teilen diese Ebene.