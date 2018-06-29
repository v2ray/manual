# Versionsgeschichte

![Englisch](../resources/englishc.svg) [![Chinesisch](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/01_versions.html)

## 2018.06.29 v3.27

* DNS unterstützt jetzt das EDNS-Client-Subnetz.
* Der statische DNS-Host unterstützt jetzt das Sub-Domain-Matching.

## 2018.06.15 v3.26

* Fügen Sie Dragonfly BSD-Version hinzu.

## 2018.06.01 v3.24

* Die interne Puffergröße (pro Verbindung) kann jetzt in der JSON-Konfiguration konfiguriert werden.
* mKCP unterstützt jetzt den DTLS 1.2-Header.
* TLS-Transport unterstützt jetzt nur Cipher-Suites in TLS 1.3-Spezifikation.

## 2018.05.25 v3.23

* In der JSON-Konfiguration kann der Port jetzt aus env-Variablen angegeben werden.
* JSON config unterstützt jetzt das Laden von Domains und IPs aus bestimmten Dateien.

## 2018.04.20 v3.19

* Traffic-Statistiken für eingehende Proxys

## 2018.04.13 v3.17

* V2Ray kann die Konfigurationsdatei von HTTP (s) laden.
* TLS in V2Ray kann neue Zertifikate von bereitgestellten CA-Zertifikaten für Domänen in eingehenden Anforderungen ausstellen.
* [HTTP / 2](../configuration/transport/h2.md) Transport.

## 2018.04.06 v3.16

* [Statistiken](../configuration/stats.md).
* Shadowsocks inbound können jetzt so konfiguriert werden, dass sie nur auf UDP warten. Es wird dringend empfohlen, nicht auf TCP und UDP auf demselben Port zu hören.

## 2018.03.02 v3.11

* In VMess Inbound werden neue Einstellungen eingeführt, um Clients zu verbieten, die unsichere Verschlüsselungsmethoden verwenden.
* Bietet ARMv7-Version.
* Bietet MIPS-Version, die FPU nicht erfordert.

## 2018.02.23 v3.10

* Protokolleinträge enthalten jetzt Sitzungs-ID zur Unterscheidung von Proxy-Sitzungen.
* Fehlerbehebung.

## 2018.02.15 v3.9

* Frohes neues Jahr!
* Fehlerbehebung.

## 2018.02.09 v3.7

* Entwicklervorschau: [Remote API](../configuration/api.md).
* Fehlerbehebung.

## 2017.12.29 v3.5

* Geoip unterstützt nun die private Netzwerkadresse unter dem Namen "privat".

## 2017.12.22 v3.4

* Websocket nows verwendet den Wert der X-Forwarded-For-Kopfzeile als Quelladresse.
* Unterstützt die s390x-CPU-Architektur.

## 2017.12.08 v3.1

* Unterstützungsrichtlinie
* Der Speicherort der Konfigurationsdatei kann über die Umgebungsvariable angegeben werden.

## 2017.12.01 v3.0

* Unterstütze Shadowsocks AEAD

## 2017.11.18 v2.50

* `v2ray` nun versucht, `v2ctl` für das Konfigurations-Parsing zu verwenden. Bitte stellen Sie sicher, dass diese 2 Dateien im selben Verzeichnis sind.
* Neue `IPOnDemand` Strategie im Routing.

## 2017.11.10 v2.47

* `geosite` Daten sind jetzt in `geosite.dat` Datei.
* Fehlerbehebung.

## 2017.11.03 v2.46

* Router unterstützt nun `geosite: cn`, entspricht den `vorhandenen chinasites`, ist aber flexibler.
* Der Router unterstützt jetzt `GeoIP`. 
  * Datei `geoip.dat` wird zu Release-Paketen hinzugefügt. Diese Datei enthält alle `GeoIP` Informationen und muss im selben Verzeichnis von `v2ray` Programm bleiben. Aufgrund der verzögerten Aktualisierung des Installationsskripts müssen Sie die Datei möglicherweise manuell kopieren.
* Programm `v2ctl` wird zu Release-Paketen hinzugefügt. Sie können `v2ctl verify / path / to / v2ray` ausführen, um die Signatur von `v2ray` Programm zu überprüfen.

## 2017.10.27 v2.44

* HTTP unterstützt jetzt die Standardauthentifizierung.
* Einige Fehler wurden behoben.

## 2017.10.06 v2.40

* Beheben Sie ein Problem, das Speicherverlust verursacht.

## 2017.09.29 v2.39

* Eingehende Proxys schließen Verbindungen jetzt schneller, wenn der Remote-Server sie schließt.
* Das Standard-Verbindungstimeout ändert sich auf 5 Minuten.

## 2017.05.12 v2.27

* Neuer Domänenmodus im Router.

## 2017.05.05 v2.26

* Stabilität korrigiert.

## 2017.04.28 v2.25

* Einfaches Sniffing auf HTTP- und TLS-Verkehr für die aktuelle Domain auf Anfrage.

## 2017.04.21 v2.24

* Mux stabilisieren.
* Verbessert die Speichereffizienz.

## 2017.04.15 v2.23

* Leistungsverbesserung in Mux.
* Die maximale Anzahl der Verbindungen kann jetzt in Mux konfiguriert werden.
* Leistungsverbesserung bei HTTP-Eingang
* connectionReuse-Einstellung wird zugunsten von Mux entfernt.

## 2017.04.08 v2.22

* Mux.Cool Protokoll.

## 2017.02.25 v2.20

* Die GPG-Signatur wird dem Download-Paket hinzugefügt.
* Die neue Binärdatei wv2ray.exe wird dem Windows-Paket hinzugefügt, das als Hintergrundanwendung ausgeführt wird.

## 2017.02.18 v2.19

* Ein neuer Mechanismus für den Anti-Antwort-Angriff wird nun auf der Serverseite durchgesetzt. 
  * Keine Auswirkungen auf bestehende Kunden.
* Upgrade von VMess AES-128-GCM / Chacha20-Poly1305 / Keine Verschlüsselungsmethoden. 
  * Bitte aktualisieren Sie Client und Server sofort.
  * AES-128-CFB ist nicht betroffen.
* Errichtet mit Golang 1.8. Fügen Sie 32-Bit-MIPS-Unterstützung hinzu.

## 2017.02.11 v2.18

* WebSocket-Code bereinigen
* Entfernen Sie die allowPassive-Option. Jetzt sind passive Verbindungen immer erlaubt.
* Fehlerbehebung

## 2017.02.04 v2.17

* Fehlerbehebung.

## 2017.01.28 v2.16

* Neue "Redirect" -Option in Freiheit. Es kann verwendet werden, um Werkzeuge wie Shadowsocks Obfs anzupassen.
* Leistungsverbesserung im VMess Nicht-Verschlüsselungsmodus. Nicht kompatibel mit früheren Versionen.
* Frohes neues Jahr!

## 2017.01.16 v2.15

* Alle Proxies können jetzt mKCP und WebSocket verwenden.

## 2017.01.09 v2.14

* Socken 5 Outbound.
* Fehlerbehebung.

## 2017.01.02 v2.13

* Fehlerbehebung.

## 2016.12.26 v2.12

* Fehlerbehebung.

## 2016.12.19 v2.11

* Die JSON-Konfigurationsdatei unterstützt nun einen Kommentar.

## 2016.12.12 v2.10

* VMess unterstützt nun die Verschlüsselungsmethoden AES-GCM und ChaCha20-Poly1305.

## 2016.12.05 v2.9

* Korrigiere Kompatibilität mit Alpine Linux.

## 2016.11.28 v2.8

* Der Shadowsocks-Server akzeptiert jetzt OTA-Einstellungen.
* Fehlerbehebung.

## 2016.11.21 v2.7

* Main eingehende und ausgehende Verbindungshandler können jetzt markiert werden.
* Fehlerbehebung.

## 2016.11.14 v2.6

* Daten, die von einem Ausgang gesendet werden, können an einen anderen Ausgang weitergeleitet werden.
* Das Routing kann auf dem eingehenden Tag basieren.

## 2016.11.07 v2.5

* New Shadowsocks Ausgang;
* Neuer TCP-Header: HTTP;

## 2016.10.24 v2.4

* TCP / mKCP / WebSocket kann pro eingehende / ausgehende konfiguriert werden;
* Routing kann auf Source-IP erfolgen;

## 2016.10.17 v2.3

* Einführung einer neuen Protobuf-basierten Konfiguration
* OpenBSD-Binärdateien;
* Kleine Korrekturen;

## 2016.09.19 v2.2

* Neuer Transport: WebSocket (Danke an [@xiaokangwang](https://github.com/xiaokangwang));

## 2016.09.19 v2.1

* mKCP Leistungsverbesserung;

## 2016.08.20 v2.0

* Ein Jahr;

## 2016.08.15 v1.24

* Neuer mKCP-Header: utp;
* Neue Option in der eingehenden Verbindungskonfiguration "allowPassive" erlaubt eine passive Verbindung;

## 2016.08.08 v1.23

* Optimieren Sie das mKCP-Paketformat. Diese Version von mKCP ist NICHT kompatibel mit früheren Versionen;
* mKCP kann jetzt so konfiguriert werden, dass es sich als Videodaten tarnt.

## 2016.08.01 v1.22

* Repariere ein Speicherleck in mKCP;
* Füge FreeBSD-Version hinzu;

## 2016.07.25 v1.21

* Hochleistungs-Chacha20 (Danke an aead @);
* Fehlerbehebung;

## 2016.07.18 v1.20

* Neue KCP-Optionen: readBufferSize und writeBufferSize;
* Fehlerbehebung;

## 2016.07.11 v1.19

* Aktivieren Sie die TLS-Option für alle Proxies.
* Beheben Sie ein Leistungsproblem in KCP.
* Beheben Sie ein Problem in KCP, das eine EOF-Antwort verursachen könnte.

## 2016.07.04 v1.18

* Behebung eines Problems mit "zu vielen offenen Dateien" in KCP;
* KCP verwendet jetzt weniger CPU;
* Andere Fehlerkorrekturen;

## 2016.06.19 v1.17

* KCP ist jetzt in V2Ray integriert. (Besonderer Dank an [xiaokangwang](https://github.com/xiaokangwang), [xtaci](https://github.com/xtaci) und [skywind3000](https://github.com/skywind3000))
* Kleinere Fehlerkorrekturen

## 2016.06.12 v1.16

* Die Wiederverwendung von TCP-Verbindungen ist jetzt standardmäßig aktiviert.
* Dokodemo-door kann TCP-Verbindungen erkennen, die von iptables umgeleitet werden;
* Blackhole kann HTTP-verbotene Daten zurücksenden;

## 2016.06.05 v1.15

* Optionale Wiederverwendung der TCP-Verbindung für bessere Leistung;
* Erlaube das Abhören einer bestimmten IP-Adresse;
* Senden von Daten über eine bestimmte IP-Adresse zulassen
* Behebung eines Problems im HTTP-Proxy, das den Speicher auslasten kann;

## 2016.05.29 v1.14

* Behebung eines Panikproblems im http-Proxy;
* Weitere Funktionen im Installationsskript;
* Statische Route in DNS;
* Offizielle Änderung der Serveradresse;

## 2016.05.16 v1.13

* Interner DNS-Server, um bessere Routing-Ergebnisse in Verbindung mit Chinasites und Chinaip zu bieten;
* Behebung eines Problems in UDP-Relay;

## 2016.05.01 v1.12.1

* Beheben Sie einen Fehler in VMess.

## 2016.05.01 v1.12

* Zweiter Versuch, das Speicherbelegungsproblem zu beheben;
* Verbessere die Shadowsocks-Leistung;
* Neue Option "none" in Loglevel;

## 2016.04.18 v1.11

* Versuchen Sie, das Speicherbelegungsproblem zu beheben.

## 2016.03.07 v1.10

* Beheben Sie ein Leistungsproblem, wenn dynamische Ports aktualisiert werden.

## 2016.02.29 v1.9.1

* Behebung des One-Time Authentication (OTA) Problems von Shadowsocks.

## 2016.02.29 v1.9

* Unterstützung für Shadowsocks ChaCha20 Verschlüsselung;
* Fügen Sie der Standardkonfigurationsdatei weitere direkte Verbindungswebsites hinzu.
* Dynamische Ports erstellen jetzt automatisch ein Konto.

## 2016.02.22 v1.8

* Aktualisieren Sie das Installationsskript install-release.sh (danke, @netcookies): 
  * Sie können den V2Ray-Prozess jetzt automatisch stoppen und nach Abschluss von V2Ray automatisch aktualisieren;
  * Die Datei install-release.sh akzeptiert das Argument --proxy und den von V2Ray angegebenen Proxy-Download.
* Verwenden Sie den Go 1.6-Compiler, um die Leistung der AES-Verschlüsselung zu verbessern.
* Kleinere Korrekturen;
* Aktualisieren Sie die offizielle IP-Adresse des Servers (laden Sie das Installationspaket erneut herunter, um die neueste Konfiguration zu erhalten).

## 2016.02.08 v1.7

* UDP-Relay-Leistung verbessert;
* Shadowsocks Sicherheit verbessert;
* Kleinere Korrekturen;
* Frohes neues Jahr!