# TCP-Transport

[![English](../../resources/english.svg)](https://www.v2ray.com/en/configuration/transport/tcp.html) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/transport/tcp.html) [![German](../../resources/german.svg)](https://www.v2ray.com/de/configuration/transport/tcp.html) [![Russian](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/transport/tcp.html)

Aufbau:

```javascript
{"Kopfzeile": {"Typ": "keine"}}
```

Woher:

* `Header`: Kopfzeilenverschleierung Einstellungen: 
  * `Art`: Art der Verschleierung Auswahlmöglichkeiten sind: 
    * `"keine"`: Standard. Keine Verschleierung.
    * `"http"`: HTTP-Verschleierung. Siehe unten.

## HTTP-Verschleierung

Die HTTP-Verschleierung muss für die eingehenden und ausgehenden verbindenden Peers konfiguriert (und passend sein).

```javascript
{"Typ": "http", "Anfrage": {"Version": "1.1", "Methode": "GET", "Pfad": ["/"], "Kopfzeilen": {"Host": [ "www.baidu.com", "www.bing.com", "User-Agent": ["Mozilla / 5.0 (Windows NT 10.0; WOW64)" AppleWebKit / 537.36 (KHTML, wie Gecko) Chrome / 53.0.2785.143 Safari /537.36 "," Mozilla / 5.0 (iPhone; CPU iPhone OS 10_0_2 wie Mac OS X) AppleWebKit / 601.1 (KHTML, wie Gecko) CriOS / 53.0.2785.109 Mobil / 14A456 Safari / 601.1.46 "]," Accept-Encoding " : ["gzip, deflate"], "Verbindung": ["keep-alive"], "Pragma": "no-cache"}}, "Antwort": {"version": "1.1", "status": "200", "Grund": "OK", "Kopfzeilen": {"Content-Type": ["application / octet-stream", "video / mpeg"], "Transfer-Encoding": ["chunked"] , "Verbindung": ["keep-alive"], "Pragma": "no-cache"}}}
```

Where:

* `Typ`: gleich `Typ` Eintrag wie in `tcpSettings`.
* `anfordern`: HTTP-Anfrageeinstellungen: 
  * `Version`: HTTP-Version, Standardwert `"1.1"`
  * `Methode`: HTTP-Methode, Standardwert `"GET"`.
  * `Pfad`: Pfad. Ein String-Array. Der Standardwert ist `["/"]`. Wenn mehrere Werte vorhanden sind, wird der Wert für jede Anforderung zufällig ausgewählt.
  * `Header`: HTTP-Header. Es ist ein Schlüsselwertpaar. Jeder Schlüssel ist der Schlüssel des HTTP-Headers und der Wert ist der Wert des HTTP-Headers. Wenn mehrere Werte festgelegt sind, wird der effektive Wert für jede Anforderung zufällig ausgewählt. Die Standardeinstellungen sind die gleichen wie im obigen Beispiel.
* `Antwort`: HTTP-Antwort 
  * `Version`: HTTP-Version. Standardwert ist `"1.1"`.
  * `Status`: HTTP-Status. Standardwert ist `"200"`.
  * `Grund`: HTTP-Statustext. Standardwert ist `"OK"`.
  * `Header`: HTTP-Header. Wie Anforderungsheader, aber für die Antwort.