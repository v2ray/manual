# Umgebungsvariablen

![Englisch](../resources/englishc.svg) [![Chinesisch](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/env.html)

V2Ray liest die folgenden Umgebungsvariablen.

## Cache-Größe pro Verbindung

* Name: `v2ray.ray.buffer.size` oder `V2RAY_RAY_BUFFER_SIZE`
* Einheit: MBytes
* Standardwert: 10
* Sonderwert: 0 für unbegrenzte Cache-Größe

Wenn es bei jeder Verbindung einen Geschwindigkeitsunterschied zwischen eingehenden und ausgehenden Datenverkehr gibt, speichert V2Ray einige Daten für einen größeren Durchsatz zwischen. Diese Einstellung steuert die Größe des Caches. Je größer der Cache, desto besser die Leistung.

## Speicherort des V2Ray-Assets

* Name: `v2ray.location.asset` oder `V2RAY_LOCATION_ASSET`
* Standardwert: Dasselbe Verzeichnis, in dem v2ray ist.

Diese Variable gibt ein Verzeichnis an, in dem sich die Dateien geoip.dat und geosite.dat befinden.

## Speicherort der V2Ray-Konfiguration

* Name: `v2ray.location.config` oder `V2RAY_LOCATION_CONFIG`
* Standardwert: Dasselbe Verzeichnis, in dem v2ray ist.

Diese Variable gibt ein Verzeichnis an, in dem sich config.json befindet.