# Konfigurationsübersicht

![Englisch](../resources/englishc.svg) [![Chinesisch](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/01_overview.html)

V2Ray teilt die gleiche Struktur der Konfiguration zwischen der Serverseite und der Clientseite wie unten gezeigt. Server- und Client-Konfigurationen unterscheiden sich in bestimmten Abschnitten.

```javascript
{"log": {}, "api": {}, "DNS": {}, "Statistik": {}, "routing": {}, "Richtlinie": {}, "Inbound": {}, "outbound": {}, "inboundDetour": [], "outboundDetour": [], "Transport": {}}
```

Woher:

* `log`: Protokollkonfiguration. Siehe unten für Details.
* `api`: RPC-API zur Steuerung der V2Ray-Instanz. Weitere Informationen finden Sie unter [API-Konfiguration](api.md).
* `DNS`: Konfiguration des internen DNS-Servers, wenn dieser Abschnitt weggelassen oder leer ist, verwendet V2Ray Ihre systemweite DNS-Konfiguration. Weitere Informationen finden Sie unter [DNS-Konfigurationen](dns.md).
* `stats`: Wenn angegeben, ist intern [Statistics](stats.md) aktiviert.
* `Richtlinie`: Konfigurationen für Berechtigungen und andere Sicherheitsstrategien. Weitere Informationen finden Sie unter [Lokale Richtlinie](policy.md).
* `Routing`: [Routing Konfiguration](routing.md).
* `Eingang`: Master-Eingangsschnittstellenkonfiguration.
* `Ausgang`: Master-Ausgangsschnittstellenkonfiguration.
* `inboundDetour`: Zusätzliche eingehende Schnittstellenkonfigurationen.
* `outboundDetour`: Zusätzliche Konfigurationen für ausgehende Schnittstellen.
* `Transport`: Konfigurationen des Transportprotokolls auf niedriger Ebene. Weitere Informationen finden Sie unter [Protokolltransportoptionen](transport.md).

## Protokollkonfiguration (Protokoll)

```javascript
{"access": "/ Pfad / zu / Datei", "Fehler": "/ Pfad / zu / Datei", "Loglevel": "Warnung"}
```

Woher:

* `Zugriff`: Pfad des Zugriffsprotokolls, verfügbare Beispiele sind: 
  * Ein gültiger Dateipfad, z. B. `"/tmp/v2ray/_access.log"`(Linux) oder `"C: \ Temp \ v2ray \ _access.log"`(Windows);
  * Lassen Sie es leer Protokolle zu verwerfen, und der Inhalt wird aussenden durch `stdout`.
* `Error`: Pfad des Fehlerprotokolls, verfügbare Beispiele sind: 
  * Ein gültiger Dateipfad, z. B. `"/tmp/v2ray/_error.log"`(Linux) oder `"C: \ Temp \ v2ray \ _error.log"`(Windows);
  * Lassen Sie es leer Protokolle zu verwerfen, und der Inhalt wird aussenden durch `stdout`.
* `Loglevel`: Anzahl der Protokolldateien, verfügbare Werte sind`"Debug"`,`"Info"`,`"Warnung"`,`"Fehler"`und`"keine"`; 
  * Unter all diesen Ebenen verlässt `"debug"` das meiste Protokoll, `"error"` lässt das geringste Protokoll.
  * `"keine"` würde alle Fehlerprotokolle verwerfen.
  * Der Standardwert ist `"Warnung"` wenn Sie ihn leer lassen.

## Master-Eingangsschnittstellenkonfigurationen (Eingang)

Die Master-Eingangsschnittstelle wird verwendet, um Daten von Clients, Browsern oder anderen übergeordneten Proxy-Servern zu empfangen. Die verfügbaren Protokolle sind unter [Protokolle](02_protocols.md).

```javascript
{"port": 1080, "listen": "127.0.0.1", "protocol": "Protokollname", "Einstellungen": {}, "streamSettings": {}, "tag": "inbound_tag_name", "domainOverride" : ["http", "tls"]}
```

Woher:

* `Port`: Abhörport.
* `Hafen`: Port zu hören von. Akzeptierte Formate sind: 
  * Ganzzahl: aktuelle Portnummer.
  * Env-Variable (V2Ray 3.23+): Beginnend mit `"env:"`gibt eine env-Variable den Port im String-Format an, z. B. `"env: PORT"`. V2Ray dekodiert die Variable als String.
  * String (V2Ray 3.23+): Ein numerischer Zeichenfolgenwert wie `"1234"`.
* `listen`: IP-Adresse abhören, Standardwert ist `"0.0.0.0"`.
* `Protokoll`: Protokollname, alle verfügbaren Werte sind in [Protokolle](02_protocols.md).
* `Einstellungen`: Protokollspezifische Einstellungen, Details finden Sie auf den Detailseiten der Protokolle.
* `streamSettings`: siehe [Protokolltransportoptionen](05_transport.md).
* `Tag`: Das Tag dieser eingehenden Schnittstelle, das unter allen eingehenden / ausgehenden Schnittstellen eindeutig sein sollte.
* `domainOverride`: erkennt die Pakete bestimmter Protokolle und leitet seine Anforderungsziele um. 
  * Akzeptiert ein Array von Strings, der Standardwert ist leer.
  * Verfügbare Werte sind `"http"` und `"tls"`.

## Konfiguration ausgehender Master-Schnittstellen (ausgehend)

Die Master-Ausgangsschnittstelle wird verwendet, um Daten an entfernte Server oder den nächsten Proxy-Server zu senden. Verfügbare Protokolle sind unter [Protokolle](02_protocols.md)aufgelistet.

```javascript
{"sendThrough": "0.0.0.0", "Protokoll": "Protokollname", "Einstellungen": {}, "Tag": "this_outbound_tag_name", "streamSettings": {}, "proxySettings": {"tag": "another_outbound_tag_name"}, "mux": {}}
```

Woher:

* `sendThrough`: Die Netzwerkschnittstelle (IP) zum Senden von Daten, verfügbar, wenn mehrere IPs angezeigt werden, der Standardwert ist `"0.0.0.0"`.
* `Protokoll`: Protokollname, alle verfügbaren Werte sind in [Protokolle](02_protocols.md).
* `Einstellungen`: Protokollspezifische Einstellungen, Details finden Sie auf den Detailseiten der Protokolle.
* `Tag`: Das Tag dieser ausgehenden Schnittstelle, das unter allen eingehenden / ausgehenden Schnittstellen eindeutig sein sollte.
* `streamSettings`: siehe [Protokolltransportoptionen](05_transport.md).
* `Proxy-Einstellungen`: Proxy für ausgehende Verbindungen. Wenn dies festgelegt ist, wird `streamSettings` dieses Ausgangs weggelassen und deaktiviert. 
  * `Tag`: Wenn ein anderes Ausgangs-Tag angegeben wird, werden die Daten an den angegebenen Ausgang gesendet.
* `Mux`: [Mux Konfigurationen](mux.md).

## Konfiguration zusätzlicher Inbound-Schnittstellen (eingehende Umleitung)

Dieser Abschnitt ist ein Array, das mehrere Konfigurationen für zusätzliche eingehende Schnittstellen enthält, die jeweils die folgende Struktur verwenden:

```javascript
{"protocol": "Protokollname", "Port": "Portnummer", "Tag": "this_inbound_tag_name", "listen": "127.0.0.1", "allocate": {"strategie": "always", "refresh ": 5," Nebenläufigkeit ": 3}," Einstellungen ": {}," streamSettings ": {}," domainOverride ": [" http "," tls "]}
```

Woher:

* `Protokoll`: Protokollname, alle verfügbaren Werte sind in [Protokolle](02_protocols.md).
* `Hafen`: Port zu hören von. Akzeptierte Formate sind: 
  * Ganzzahl: aktuelle Portnummer.
  * Env-Variable (V2Ray 3.23+): Beginnend mit `"env:"`gibt eine env-Variable den Port im String-Format an, z. B. `"env: PORT"`. V2Ray dekodiert die Variable als String.
  * String: Entweder ein numerischer Stringwert wie `"1234"`oder ein Portbereich wie `"5-10"` der für Portnummer 5 bis 10 steht.
* `Tag`: Das Tag dieser eingehenden Schnittstelle, das unter allen eingehenden / ausgehenden Schnittstellen eindeutig sein sollte.
* `listen`: IP-Adresse abhören, Standardwert ist `"0.0.0.0"`.
* `zuordnen`: Zuweisungsoptionen: 
  * `Strategie`: Zuweisungsstrategien, verfügbare Werte sind `"immer"` und `"zufällig"`. Für die Option `"immer"` alle Ports zu, die durch `"Port"` Einstellungen spezifiziert sind; Für `"zufällige"`würde jedes bestimmte Minuten bestimmte Ports unter den Port-Bereichen wählen, konfiguriert durch `"Refresh"`, `"Port"`und `"Parallelität"`.
  * `Refresh`: Das Intervall, in dem zufällige Ports aktualisiert werden, mit Minuteneinheiten. Mindestwert ist `2`, empfohlener Wert ist `5`. Diese Einstellung wird nur wirksam, wenn `Strategie = Zufall`.
  * `Nebenläufigkeit`: Anzahl der zufälligen Ports. Der Minimalwert ist `1`, der Maximalwert ist die Hälfte der Reichweite der Ports. Empfohlener Wert ist `3`.
* `Einstellungen`: Protokollspezifische Einstellungen, Details finden Sie auf den Detailseiten der Protokolle.
* `streamSettings`: siehe [Protokolltransportoptionen](05_transport.md).
* `domainOverride`: erkennt die Pakete bestimmter Protokolle und leitet seine Anforderungsziele um. 
  * Akzeptiert ein Array von Strings, der Standardwert ist leer.
  * Verfügbare Werte sind `"http"` und `"tls"`.

### Konfiguration zusätzlicher Outbound-Schnittstellen (Outbound-Umleitung)

Dieser Abschnitt ist ein Array, das mehrere Konfigurationen für extra ausgehende Schnittstellen enthält, die jeweils die folgende Struktur verwenden:

```javascript
{"Protokoll": "Protokollname", "sendThrough": "0.0.0.0", "Tag": "this_outbound_tag_name", "Einstellungen": {}, "streamSettings": {}, "proxySettings": {"tag": "another_outbound_tag_name"}, "mux": {}}
```

Woher:

* `Protokoll`: Protokollname, alle verfügbaren Werte sind in [Protokolle](02_protocols.md).
* `sendThrough`: Die Netzwerkschnittstelle (IP) zum Senden von Daten, verfügbar, wenn mehrere IPs angezeigt werden, der Standardwert ist `"0.0.0.0"`.
* `Tag`: Ausgangs - Tag - Name des aktuellen Schnittstelle, Daten würden über diese Schnittstelle gesendet werden , wenn diese in abgehenden Routing - Konfigurationen oder andere outbound des ausgewählt ist `proxySettings`.
* `Einstellungen`: Protokollspezifische Einstellungen, Details finden Sie auf den Detailseiten der Protokolle.
* `streamSettings`: Einzelheiten finden Sie unter [Protokolltransportoptionen](05_transport.md).
* `Proxy-Einstellungen`: Proxy für ausgehende Verbindungen. Wenn dies festgelegt ist, wird `streamSettings` dieses Ausgangs weggelassen und deaktiviert. 
  * `Tag`: Wenn ein anderes Ausgangs-Tag angegeben wird, werden die Daten an den angegebenen Ausgang gesendet.
* `Mux`: [Mux Konfigurationen](mux.md).