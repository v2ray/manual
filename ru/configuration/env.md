---
refcn: chapter_02/env
refen: configuration/env
---

# Переменные окружения

V2Ray считывает следующие переменные среды.

## Размер кеша на соединение {#buffer-size}

* Имя: `v2ray.ray.buffer.size` или `V2RAY_RAY_BUFFER_SIZE`
* Единицы: МБ
* Default value: 2 on x86, amd64, arm64 and s390x. This cache is disabled on other platforms.
* Диапазон: от 0 до бесконечности

**Deprecated. Use bufferSize in Policy.**

For each connection, when there is a difference in speed between inbound and outbound traffic, V2Ray will cache some data for larger throughput. This setting controls the size of the cache. The larger the cache, the better the performance.

## Расположение данных V2Ray {#asset}

* Имя: `v2ray.location.asset` или `V2RAY_LOCATION_ASSET`
* Значение по умолчанию: директория, где находится v2ray.

This variable specifies a directory where geoip.dat and geosite.dat files are.

## Расположение конфигурации V2Ray {#config}

* Имя: `v2ray.location.config` или `V2RAY_LOCATION_CONFIG`
* Значение по умолчанию: директория, где находится v2ray.

This variable specifies a directory where config.json is.

## Рассеянное чтение (Scatter reading) {#scatter-io}

* Имя: `v2ray.buf.readv` или `V2RAY_BUF_READV`
* Значение по умолчанию: `auto`

V2Ray 3.37 uses Scatter/Gather IO. This feature will use less memory when connection speed is over 100 MByte/s. Possible values are: `auto`, `enable` and `disable`.

* `enable`: Включить рассеянное чтение.
* `disable`: Выключить рассеянное чтение.
* `auto`: Включить рассеянное чтение только на Windows, MacOS, Linux с ЦП x86, AMD64 или s390x.

When connection speed is less than 100 MByte/s, no matter whether this is enabled or not, there is no obvious difference in terms of memory usage.