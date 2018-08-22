# Umgebungsvariablen

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/env.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/env.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/env.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/env.html)

V2Ray liest die folgenden Umgebungsvariablen.

## Cache size per connection {#buffer-size}

* Name: `v2ray.ray.buffer.size` oder `V2RAY_RAY_BUFFER_SIZE`
* Einheit: MBytes
* Default value: 
  * (V2Ray 3.33-) 10
  * (V2Ray 3.34+) 2 on x86, amd64, arm64 and s390x. This cache is disabled on other platforms.
* Sonderwert: 0 für unbegrenzte Cache-Größe

Wenn es bei jeder Verbindung einen Geschwindigkeitsunterschied zwischen eingehenden und ausgehenden Datenverkehr gibt, speichert V2Ray einige Daten für einen größeren Durchsatz zwischen. Diese Einstellung steuert die Größe des Caches. Je größer der Cache, desto besser die Leistung.

## Location of V2Ray asset {#asset}

* Name: `v2ray.location.asset` oder `V2RAY_LOCATION_ASSET`
* Standardwert: Dasselbe Verzeichnis, in dem v2ray ist.

Diese Variable gibt ein Verzeichnis an, in dem sich die Dateien geoip.dat und geosite.dat befinden.

## Location of V2Ray config {#config}

* Name: `v2ray.location.config` oder `V2RAY_LOCATION_CONFIG`
* Standardwert: Dasselbe Verzeichnis, in dem v2ray ist.

Diese Variable gibt ein Verzeichnis an, in dem sich config.json befindet.