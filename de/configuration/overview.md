---
refcn: chapter_02/01_overview
refen: configuration/overview
---
# Konfigurationsübersicht

V2Ray shares a same structure of configuration between server side and client side shown as below. Server and client configurations are different in specific sections.

Below is the top level structure of the configuration. Each section has its own format.

```javascript
{
  "log": {},
  "api": {},
  "dns": {},
  "stats": {},
  "routing": {},
  "policy": {},
  "inbound": {},
  "outbound": {},
  "inboundDetour": [],
  "outboundDetour": [],
  "transport": {}
}
```

Woher:

* `log`: log configuration. See below for detail.
* `api`: RPC API to control the V2Ray instance. See [API configuration](api.md) for details.
* `DNS`: Konfiguration des internen DNS-Servers, wenn dieser Abschnitt weggelassen oder leer ist, verwendet V2Ray Ihre systemweite DNS-Konfiguration. Weitere Informationen finden Sie unter [DNS-Konfigurationen](dns.md).
* `stats`: Wenn angegeben, ist intern [Statistics](stats.md) aktiviert.
* `policy`: Configurations for permissions and other security strategies. For details, see [Local Policy](policy.md).
* `Routing`: [Routing Konfiguration](routing.md).
* `Eingang`: Master-Eingangsschnittstellenkonfiguration.
* `Ausgang`: Master-Ausgangsschnittstellenkonfiguration.
* `inboundDetour`: Zusätzliche eingehende Schnittstellenkonfigurationen.
* `outboundDetour`: Zusätzliche Konfigurationen für ausgehende Schnittstellen.
* `transport`: low-level transport protocol's configurations. For details, see [Protocol Transport Options](transport.md).

## Log configuration {#log}

```javascript
{
  "access": "/path/to/file",
  "error": "/path/to/file",
  "loglevel": "warning"
}
```

Woher:

* `Zugriff`: Pfad des Zugriffsprotokolls, verfügbare Beispiele sind: 
  * Ein gültiger Dateipfad, z. B. `"/tmp/v2ray/_access.log"`(Linux) oder `"C: \ Temp \ v2ray \ _access.log"`(Windows);
  * Lassen Sie es leer Protokolle zu verwerfen, und der Inhalt wird aussenden durch `stdout`.
* `Error`: Pfad des Fehlerprotokolls, verfügbare Beispiele sind: 
  * Ein gültiger Dateipfad, z. B. `"/tmp/v2ray/_error.log"`(Linux) oder `"C: \ Temp \ v2ray \ _error.log"`(Windows);
  * Lassen Sie es leer Protokolle zu verwerfen, und der Inhalt wird aussenden durch `stdout`.
* `Loglevel`: Level of log files, available values are`"debug"`、`"info"`、`"warning"`、`"error"`, and`"none"`; 
  * Unter all diesen Ebenen verlässt `"debug"` das meiste Protokoll, `"error"` lässt das geringste Protokoll.
  * `"keine"` würde alle Fehlerprotokolle verwerfen.
  * Der Standardwert ist `"Warnung"` wenn Sie ihn leer lassen.

## Master Inbound Interface Configurations {#inbound}

Master inbound interface is used to receive data from clients, browsers, or other parent proxy servers, available protocols are listed at [Protocols](protocols.md).

```javascript
{
  "port": 1080,
  "listen": "127.0.0.1",
  "protocol": "protocol_name",
  "settings": {},
  "streamSettings": {},
  "tag": "inbound_tag_name",
  "domainOverride": ["http", "tls"],
  "sniffing": {
    "enabled": false,
    "destOverride": ["http", "tls"]
  }
}
```

Woher:

* `Port`: Abhörport.
* `Hafen`: port to be listen from. Accepted formats are: 
  * Ganzzahl: aktuelle Portnummer.
  * Env variable (V2Ray 3.23+): Beginning with `"env:"`, an env variable specifies the port in string format, such as `"env:PORT"`. V2Ray will decode the variable as string.
  * String (V2Ray 3.23+): Ein numerischer Zeichenfolgenwert wie `"1234"`.
* `listen`: IP-Adresse abhören, Standardwert ist `"0.0.0.0"`.
* `protocol`: protocol name, all available values are listed at [Protocols](protocols.md).
* `Einstellungen`: Protokollspezifische Einstellungen, Details finden Sie auf den Detailseiten der Protokolle.
* `streamSettings`: see [Protocol Transport Options](transport.md).
* `Tag`: Das Tag dieser eingehenden Schnittstelle, das unter allen eingehenden / ausgehenden Schnittstellen eindeutig sein sollte.
* `domainOverride`: erkennt die Pakete bestimmter Protokolle und leitet seine Anforderungsziele um. 
  * Akzeptiert ein Array von Strings, der Standardwert ist leer.
  * Verfügbare Werte sind `"http"` und `"tls"`.
  * (V2Ray 3.32+) Deprecated. Use `sniffing`. When `domainOverride` is set but `sniffing` is not set, V2Ray will enable `sniffing` anyway.
* `sniffing` (V2Ray 3.32+): Try to sniff current connection. 
  * `enabled`: Whether or not to enable sniffing.
  * `destOverride`: When current connection uses a protocol specified in the list, override its destination by sniff'ed destination. 
    * Verfügbare Werte sind `"http"` und `"tls"`.

## Master Outbound Interface Configurations {#outbound}

Master outbound interface is used to send data to remote servers or next proxy server. Available protocols are listed at [Protocols](protocols.md).

```javascript
{
  "sendThrough": "0.0.0.0",
  "protocol": "protocol_name",
  "settings": {},
  "tag": "this_outbound_tag_name",
  "streamSettings": {},
  "proxySettings": {
    "tag": "another_outbound_tag_name"
  },
  "mux": {}
}
```

Woher:

* `sendThrough`: Die Netzwerkschnittstelle (IP) zum Senden von Daten, verfügbar, wenn mehrere IPs angezeigt werden, der Standardwert ist `"0.0.0.0"`.
* `protocol`: protocol name, all available values are listed at [Protocols](protocols.md).
* `Einstellungen`: Protokollspezifische Einstellungen, Details finden Sie auf den Detailseiten der Protokolle.
* `Tag`: Das Tag dieser ausgehenden Schnittstelle, das unter allen eingehenden / ausgehenden Schnittstellen eindeutig sein sollte.
* `streamSettings`: see [Protocol Transport Options](transport.md).
* `Proxy-Einstellungen`: Proxy for outbound connections. When this is set, `streamSettings` of this outbound will be omitted and disabled. 
  * `Tag`: Wenn ein anderes Ausgangs-Tag angegeben wird, werden die Daten an den angegebenen Ausgang gesendet.
* `Mux`: [Mux Konfigurationen](mux.md).

## Extra Inbound Interfaces Configurations {#inbound-detour}

This section is an array contains multiple extra inbound interfaces' configurations, each are using the structure like below:

```javascript
{
  "protocol": "protocol_name",
  "port": "port_number",
  "tag": "this_inbound_tag_name",
  "listen": "127.0.0.1",
  "allocate": {
    "strategy": "always",
    "refresh": 5,
    "concurrency": 3
  },
  "settings": {},
  "streamSettings": {},
  "domainOverride": ["http", "tls"],
  "sniffing": {
    "enabled": false,
    "destOverride": ["http", "tls"]
  }
}
```

Woher:

* `protocol`: protocol name, all available values are listed at [Protocols](protocols.md).
* `Hafen`: port to be listen from. Accepted formats are: 
  * Ganzzahl: aktuelle Portnummer.
  * Env variable: Beginning with `"env:"`, an env variable specifies the port in string format, such as `"env:PORT"`. V2Ray will decode the variable as string.
  * String: Entweder ein numerischer Stringwert wie `"1234"`oder ein Portbereich wie `"5-10"` der für Portnummer 5 bis 10 steht.
* `Tag`: Das Tag dieser eingehenden Schnittstelle, das unter allen eingehenden / ausgehenden Schnittstellen eindeutig sein sollte.
* `listen`: IP-Adresse abhören, Standardwert ist `"0.0.0.0"`.
* `zuordnen`: Zuweisungsoptionen: 
  * `Strategie`: Zuweisungsstrategien, verfügbare Werte sind `"immer"` und `"zufällig"`. Für die Option `"immer"` alle Ports zu, die durch `"Port"` Einstellungen spezifiziert sind; Für `"zufällige"`würde jedes bestimmte Minuten bestimmte Ports unter den Port-Bereichen wählen, konfiguriert durch `"Refresh"`, `"Port"`und `"Parallelität"`.
  * `Refresh`: Das Intervall, in dem zufällige Ports aktualisiert werden, mit Minuteneinheiten. Mindestwert ist `2`, empfohlener Wert ist `5`. Diese Einstellung wird nur wirksam, wenn `Strategie = Zufall`.
  * `concurrency`: Number of random ports. Minimum value is `1`, maximum value is a half of ports' range. Recommended value is `3`.
* `Einstellungen`: Protokollspezifische Einstellungen, Details finden Sie auf den Detailseiten der Protokolle.
* `streamSettings`: see [Protocol Transport Options](transport.md).
* `domainOverride`: erkennt die Pakete bestimmter Protokolle und leitet seine Anforderungsziele um. 
  * Akzeptiert ein Array von Strings, der Standardwert ist leer.
  * Verfügbare Werte sind `"http"` und `"tls"`.
  * (V2Ray 3.32+) Deprecated. Use `sniffing`. When `domainOverride` is set but `sniffing` is not set, V2Ray will enable `sniffing` anyway.
* `sniffing` (V2Ray 3.32+): Try to sniff current connection. 
  * `enabled`: Whether or not to enable sniffing.
  * `destOverride`: When current connection uses a protocol specified in the list, override its destination by sniff'ed destination. 
    * Verfügbare Werte sind `"http"` und `"tls"`.

### Extra Outbound Interfaces Configurations {#outbound-detour}

This section is an array contains multiple extra outbound interfaces' configurations, each are using the structure like below:

```javascript
{
  "protocol": "protocol_name",
  "sendThrough": "0.0.0.0",
  "tag": "this_outbound_tag_name",
  "settings": {},
  "streamSettings": {},
  "proxySettings": {
    "tag": "another_outbound_tag_name"
  },
  "mux": {}
}
```

Woher:

* `protocol`: protocol name, all available values are listed at [Protocols](protocols.md).
* `sendThrough`: Die Netzwerkschnittstelle (IP) zum Senden von Daten, verfügbar, wenn mehrere IPs angezeigt werden, der Standardwert ist `"0.0.0.0"`.
* `Tag`: Ausgangs - Tag - Name des aktuellen Schnittstelle, Daten würden über diese Schnittstelle gesendet werden , wenn diese in abgehenden Routing - Konfigurationen oder andere outbound des ausgewählt ist `proxySettings`.
* `Einstellungen`: Protokollspezifische Einstellungen, Details finden Sie auf den Detailseiten der Protokolle.
* `streamSettings`: For details, see [Protocol Transport Options](transport.md).
* `Proxy-Einstellungen`: Proxy for outbound connections. When this is set, `streamSettings` of this outbound will be omitted and disabled. 
  * `Tag`: Wenn ein anderes Ausgangs-Tag angegeben wird, werden die Daten an den angegebenen Ausgang gesendet.
* `Mux`: [Mux Konfigurationen](mux.md).