---
refcn: chapter_02/transport/tcp
refen: configuration/transport/tcp
---
# TCP-Transport

Konfiguration:

```javascript
{"Kopfzeile": {"Typ": "keine"}}
```

Wo:

* `header`: Kopfzeilenverschleierung Einstellungen: 
  * `type`: Type of obfuscation. Choices are: 
    * `"none"`: Default. No obfuscation at all.
    * `"http"`: HTTP obfuscation. See below.

## HTTP-Verschleierung

Die HTTP-Verschleierung muss für die eingehenden und ausgehenden verbindenden Peers konfiguriert (und passend sein).

```javascript
{"Typ": "http", "Anfrage": {"Version": "1.1", "Methode": "GET", "Pfad": ["/"], "Kopfzeilen": {"Host": [ "www.baidu.com", "www.bing.com", "User-Agent": ["Mozilla / 5.0 (Windows NT 10.0; WOW64)" AppleWebKit / 537.36 (KHTML, wie Gecko) Chrome / 53.0.2785.143 Safari /537.36 "," Mozilla / 5.0 (iPhone; CPU iPhone OS 10_0_2 wie Mac OS X) AppleWebKit / 601.1 (KHTML, wie Gecko) CriOS / 53.0.2785.109 Mobil / 14A456 Safari / 601.1.46 "]," Accept-Encoding " : ["gzip, deflate"], "Verbindung": ["keep-alive"], "Pragma": "no-cache"}}, "Antwort": {"version": "1.1", "status": "200", "Grund": "OK", "Kopfzeilen": {"Content-Type": ["application / octet-stream", "video / mpeg"], "Transfer-Encoding": ["chunked"] , "Verbindung": ["keep-alive"], "Pragma": "no-cache"}}}
```

Wo:

* `Typ`: gleich `Typ` Eintrag wie in `tcpSettings`.
* `anfordern`: HTTP-Anfrageeinstellungen: 
  * `Version`: HTTP-Version, Standardwert `"1.1"`
  * `Methode`: HTTP-Methode, Standardwert `"GET"`.
  * `path`: Path. A string array. Default value is `["/"]`. When there are multiple values, value is picked up randomly for each request.
  * `Header`: HTTP-Header. Es ist ein Schlüsselwertpaar. Jeder Schlüssel ist der Schlüssel des HTTP-Headers und der Wert ist der Wert des HTTP-Headers. Wenn mehrere Werte festgelegt sind, wird der effektive Wert für jede Anforderung zufällig ausgewählt. Die Standardeinstellungen sind die gleichen wie im obigen Beispiel.
* `response`: HTTP-Antwort 
  * `version`: HTTP version. Default value is `"1.1"`.
  * `status`: HTTP status. Default value is `"200"`.
  * `reason`: HTTP status text. Default value is `"OK"`.
  * `headers`: HTTP header. Same as request headers, but for response.