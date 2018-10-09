---
refcn: chapter_02/env
refen: configuration/env
---
# Переменные окружения

V2Ray считывает следующие переменные среды.

## Размер кеша на соединение {#buffer-size}

* Имя: `v2ray.ray.buffer.size` или `V2RAY_RAY_BUFFER_SIZE`
* Единицы: МБ
* Значение по умолчанию: 
  * (V2Ray 3.33-) 10
  * (V2Ray 3.34+) 2 on x86, amd64, arm64 and s390x. This cache is disabled on other platforms.
* Диапазон: от 0 до бесконечности

Для каждого соединения, у которого есть разница в скорости между входящим и исходящим трафиком, V2Ray будет кэшировать некоторые данные для большей пропускной способности. Этот параметр управляет размером кэша. Чем больше кеш, тем лучше производительность.

## Расположение данных V2Ray {#asset}

* Имя: `v2ray.location.asset` или `V2RAY_LOCATION_ASSET`
* Значение по умолчанию: директория, где находится v2ray.

Эта переменная указывает каталог, в котором находятся файлы geoip.dat и geosite.dat.

## Расположение конфигурации V2Ray {#config}

* Имя: `v2ray.location.config` или `V2RAY_LOCATION_CONFIG`
* Default value: Same directory where v2ray is.

Эта переменная указывает каталог, в котором находится config.json.

## Рассеянное чтение (Scatter reading) {#scatter-io}

* Имя: `v2ray.buf.readv` или `V2RAY_BUF_READV`
* Значение по умолчанию: `auto`

V2Ray 3.37 uses Scatter/Gather IO. This feature will use less memory when connection speed is over 100 MByte/s. Possible values are: `auto`, `enable` and `disable`.

* `enable`: Включить рассеянное чтение.
* `disable`: Выключить рассеянное чтение.
* `auto`: Включить рассеянное чтение только на Windows, MacOS, Linux с ЦП x86, AMD64 или s390x.

Когда скорость соединения меньше 100 Мбайт/с, независимо от того, включена опция или нет, явной разницы в использовании памяти не наблюдается.