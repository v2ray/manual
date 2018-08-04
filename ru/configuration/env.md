# Переменные окружения

[![Английский](../resources/english.svg)](https://www.v2ray.com/en/configuration/env.html) [![Китайский](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/env.html) [![Немецкий](../resources/german.svg)](https://www.v2ray.com/de/configuration/env.html) [![Русский](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/env.html)

V2Ray считывает следующие переменные среды.

## Размер кеша на соединение {#buffer-size}

* Имя: `v2ray.ray.buffer.size` или `V2RAY_RAY_BUFFER_SIZE`
* Единицы: МБ
* Значение по умолчанию: 
  * (V2Ray 3.33-) 10
  * (V2Ray 3.34+) 2 на x86, amd64, arm64 и s390x, иначе 0
* Диапазон: от 0 до бесконечности

Для каждого соединения, у которого есть разница в скорости между входящим и исходящим трафиком, V2Ray будет кэшировать некоторые данные для большей пропускной способности. Этот параметр управляет размером кэша. Чем больше кеш, тем лучше производительность.

## Расположение данных V2Ray {#asset}

* Имя: `v2ray.location.asset` или `V2RAY_LOCATION_ASSET`
* Значение по умолчанию: директория, где находится v2ray.

Эта переменная указывает каталог, в котором находятся файлы geoip.dat и geosite.dat.

## Расположение конфигурации V2Ray {#config}

* Имя: `v2ray.location.config` или `V2RAY_LOCATION_CONFIG`
* Значение по умолчанию: директория, где находится v2ray.

Эта переменная указывает каталог, в котором находится config.json.