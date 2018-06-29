# Freedom

![Englisch](../../resources/englishc.svg) [![Chinesisch](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/freedom.html)

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
* `redirect`: Leite alle Verbindungen zu dieser Adresse um, in der Form `"127.0.0.1:80"` oder `": 1234"`.
* `userLevel`: Benutzerebene. Alle Verbindungen teilen diese Ebene.