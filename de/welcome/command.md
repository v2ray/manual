* * *

refcn: chapter_00/command refen: welcome/command

* * *

# Befehlszeile

## V2Ray

V2Ray has the following commandline parameters:

```shell
v2ray [-version] [-test] [-config = Konfiguration.json] [-format = json]
```

Where:

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

V2Ctl has the following commandline parameters:

```shell
v2ctl <command> <options>
```

Available commands are listed below. Each command has its own options.

### Überprüfen

`v2ctl verify [--sig=/path/to/sigfile] /file/to/verify`

To verify the signature of a V2Ray binary.

Options:

* `sig`: Pfad zur Signaturdatei. Der Standardwert ist die Datei ".sig" für den zu verifizierenden Pfad.
* Erstes Argument: Die zu verifizierende Datei.

### Konfig

`v2ctl config`

No options. This command reads configuration in JSON format from stdin, and then write corresponding configuration in Protobuf format to stdout.

### UUID

`v2ctl uuid`

No options. This command prints a random UUID.