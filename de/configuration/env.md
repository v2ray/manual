---
refcn: chapter_02/env
refen: configuration/env
---
# Umgebungsvariablen

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
* Default value: Same directory where v2ray is.

Diese Variable gibt ein Verzeichnis an, in dem sich config.json befindet.

## Scatter Reading {#scatter-io}

* Name: `v2ray.buf.readv` or `V2RAY_BUF_READV`
* Default value: `auto`

V2Ray 3.37 uses Scatter/Gather IO. This feature will use less memory when connection speed is over 100 MByte/s. Possible values are: `auto`, `enable` and `disable`.

* `enable`: Enable scatter reading.
* `disable`: Disable scatter reading.
* `auto`: Only enable on Windows, MacOS, Linux when CPU is x86, AMD64 or s390x.

When connection speed is less than 100 MByte/s, no matter whether this is enabled or not, there is no obvious difference in terms of memory usage.