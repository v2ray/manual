# Befehlszeile

[![English](../resources/english.svg)](https://www.v2ray.com/en/welcome/command.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/command.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/welcome/command.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/welcome/command.html) [![Translate](../resources/lang.svg)](https://crowdin.com/project/v2ray)

## V2Ray

V2Ray hat die folgenden Kommandozeilenparameter:

```shell
v2ray [-version] [-test] [-config = Konfiguration.json] [-format = json]
```

Woher:

* `Version`: Nur die Version von V2Ray drucken und dann beenden.
* `-test`: Konfiguration testen, Fehler ausgeben und dann beenden.
* `-config`: URI der Konfiguration 
  * Wenn der Wert `stdin:`, liest V2Ray die Konfiguration aus der Standardeingabe. Der Anrufer muss die Standardeingabe nach dem Schreiben der Konfiguration schließen.
  * When its value begins with `http://` or `https://` (lowercase), V2Ray tries to load configuration from the remote address.
  * Wenn er nicht gesetzt ist , versucht V2Ray erste Konfiguration von laden `config.json` unter Arbeitsverzeichnis, dann aus dem Verzeichnis , das durch die Umgebungsvariable spezifiziert `v2ray.location.asset`.
* `-Format`: Konfigurationsformat Auswahlmöglichkeiten sind: 
  * `JSON`: JSON-Format.
  * `Pb` oder `Protobuf`: Protobuf-Format.

## V2Ctl

V2Ctl hat die folgenden Befehlszeilenparameter:

```shell
v2ctl <command> <options>
```

Verfügbare Befehle sind unten aufgeführt. Jeder Befehl hat seine eigenen Optionen.

### Überprüfen

`v2ctl verify [--sig = / Pfad / zu / sigfile] / file / to / verify`

Um die Signatur einer V2Ray-Binärdatei zu überprüfen.

Optionen:

* `sig`: Pfad zur Signaturdatei. Der Standardwert ist die Datei ".sig" für den zu verifizierenden Pfad.
* Erstes Argument: Die zu verifizierende Datei.

### Konfig

`v2ctl Konfiguration`

Keine Optionen. Dieser Befehl liest die Konfiguration im JSON-Format von stdin und schreibt dann die entsprechende Konfiguration im Protobuf-Format in stdout.

### UUID

`v2ctl Uuid`

Keine Optionen. Dieser Befehl druckt eine zufällige UUID.