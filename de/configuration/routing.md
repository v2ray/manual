---
refcn: chapter_02/03_routing
refen: configuration/routing
---
# Routing

V2Ray verfügt über einen internen Routing-Mechanismus. Es leitet eingehende Verbindungen basierend auf Regeln an verschiedene ausgehende Verbindungen weiter. Ein häufiges Szenario ist die Aufteilung des Datenverkehrs nach Ländern. V2Ray kann das Zielland (nach Geo-IP) einer Verbindung erkennen und sendet dann eine Verbindung zum entsprechenden ausgehenden Proxy.

Configuration:

```javascript
{
  "strategy": "rules",
  "settings": {
    "domainStrategy": "AsIs",
    "rules": [
      {
        "type": "field",
        "domain": [
          "baidu.com",
          "qq.com"
        ],
        "outboundTag": "direct"
      }
    ]
  }
}
```

Where:

* `strategy`: Der einzige gültige Wert für jetzt ist `"rules"`.
* `domainStrategy`: Domain resolution strategy. Choices are: 
  * `"AsIs"`: Only use domain for routing. Default value.
  * `"IPIfNonMatch"`: Wenn keine Regel der aktuellen Domäne entspricht, löst V2Ray sie in IP-Adressen (A- oder AAAA-Datensätze) auf und versucht alle Regeln erneut. 
    * Wenn eine Domäne mehrere IP-Adressen hat, versucht V2Ray alle von ihnen.
    * Die aufgelösten IPs werden nur für Routingentscheidungen verwendet. Der Datenverkehr wird weiterhin an die ursprüngliche Domänenadresse gesendet.
  * `"IPOnDemand"`: Solange es eine IP-basierte Regel gibt, löst V2Ray die Domäne sofort in IP auf.
* `rules`: Ein Array von Regeln. Für jede eingehende Verbindung versucht V2Ray diese Regeln von oben nach unten nacheinander auszuführen. Wenn eine Regel wirksam wird, wird die Verbindung an den Ausgang `outboundTag` der Regel weitergeleitet.

Konfiguration für jede Regel:

```javascript
{
  "type": "field",
  "domain": [
    "baidu.com",
    "qq.com",
    "geosite:cn"
  ],
  "ip": [
    "0.0.0.0/8",
    "10.0.0.0/8",
    "fc00::/7",
    "fe80::/10",
    "geoip:cn"
  ],
  "port": "0-100",
  "network": "tcp",
  "source": [
    "10.0.0.1",
  ],
  "user": [
    "love@v2ray.com"
  ],
  "inboundTag": [
    "tag-vmess"
  ],
  "protocol":["http", "tls", "bittorrent"],
  "outboundTag": "direct"
}
```

Where:

* `type`: Der einzige gültige Wert für jetzt ist `"field"`.
* `domain`: An array of domains. There are four formats: 
  * Teilzeichenfolge: Wenn diese Zeichenfolge mit einem Teil der Zieldomäne übereinstimmt, wird diese Regel wirksam. Beispiel: Regel `"sina.com"` stimmt mit Targeting Domain `überein "sina.com"`, `"sina.com.cn"` und `"www.sina.com"`, aber nicht `"sina.cn"`.
  * Regulärer Ausdruck: Beginnt mit `"regexp:"`, der Rest ist ein regulärer Ausdruck. Wenn die reguläre Ausrichtungsdatei der Ausrichtungsdomäne entspricht, wird diese Regel wirksam. Beispiel: Regel `"regexp: \. Goo. * \. Com $"` entspricht `"www.google.com"` und `"fonts.googleapis.com"`, aber nicht `"google.com"`.
  * Subdomain (recommended): Begining with `"domain:"` and the rest is a domain. Wenn die Ausrichtungsdomäne genau der Wert oder eine Unterdomäne des Werts ist, wird diese Regel wirksam. Beispiel: Regel `"domain: v2ray.com"` entspricht `"www.v2ray.com"`, `"v2ray.com"`, aber nicht `"xv2ray.com"`.
  * Full domain (V2Ray 3.36+): Begining with `"full:"` and the rest is a domain. When the targeting domain is exactly the value, the rule takes effect. Example: rule `"domain:v2ray.com"` matches `"v2ray.com"`, but not `"www.v2ray.com"`.
  * Special value `"geosite:cn"`: a list of [common domains in China](https://www.v2ray.com/links/chinasites/).
  * Special value `"geosite:speedtest"` (V2Ray 3.32+): list of all public servers of speedtest.net.
  * Domains from file (V2Ray 3.23+): Such as `"ext:file:tag"`. Der Wert muss mit `ext:` (Kleinbuchstaben) beginnen, gefolgt von Dateiname und Tag. The file is placed in [resource directory](env.md#location-of-v2ray-asset), and has the same format of `geosite.dat`. Das Tag muss in der Datei vorhanden sein.
* `ip`: An array of IP ranges. When the targeting IP is in one of the ranges, this rule takes effect. There are three formats: 
  * IP: wie `"127.0.0.1"`.
  * [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing): wie `"127.0.0.0/8"`.
  * GeoIP: such as `"geoip:cn"`. It begins with `geoip:` (lower case) and followed by two letter of country code. 
    * Sonderwert `"geoip: privat"`: für alle privaten Adressen wie `127.0.0.1`.
  * IPs aus Datei (V2Ray 3.23+): Wie `"ext: file: tag"`. The value must begin with `ext:` (lowercase), and followed by filename and tag. Die Datei wird in platziert [Ressourcenverzeichnis](env.md#location-of-v2ray-asset), und hat das gleiche Format von `geoip.dat`. The tag must exist in the file.
* `port`：Port range. Formats are: 
  * `"a-b"`: Both `a` and `b` are positive integers and less than 65536. When the targeting port is in [`a`, `b`), this rule takes effect.
  * `a`: `a` is a positive integer, and less than 65536. When the targeting port is `a`, this rule takes effect.
* `network`: Choices are `"tcp"`, `"udp"`, or `"tcp,udp"`. When the connection has in the chosen network, this rule take effect.
* `source`: An array of IP ranges. Same format as `ip`. When the source IP of the connection is in the IP range, this rule takes effect.
* `user`: An array of email address. When the inbound connection uses an user account of the email address, this rule takes effect. For now Shadowsocks and VMess support user with email.
* `inboundTag`: An array of string as inbound proxy tags. When the connection comes from one of the specified inbound proxy, this rule takes effect.
* `protocol`: An array of string as protocol types. When the connection uses one of the protocols, this rule takes effect. 
  * Available values are `"http"`,`"tls"`,`"bittorrent"`. All lower-cased.
  * `sniffing` in inbound proxy must be enabled in advance.
* `outboundTag` [Tag of the outbound](protocols.md) that the connection will be sent to, if this rule take effect.

## Tips {#tips}

* Wenn mehrere Attribute der Regel angegeben sind, müssen sie zusammen erfüllt sein, damit die Regel wirksam wird. 
  * Wenn Sie Verbindungen über `domain` oder `ip`routen möchten, benötigen Sie wahrscheinlich mehrere Regeln anstelle einer Regel, die sowohl `domain` als auch `ip`.
* `"ext:geoip.dat:cn"` entspricht `"geoip:cn"`.
* Among all domain matching modes, subdomain (beginning with "domain:") is recommended.