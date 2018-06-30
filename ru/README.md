# Project V

![English](resources/english.svg) [![Chinese](resources/chinese.svg)](https://www.v2ray.com/) [![German](resources/german.svg)](https://www.v2ray.com/de/) [![Translate](resources/lang.svg)](https://crowdin.com/project/v2ray)

Проект V - это набор инструментов, которые помогут вам создать собственную приватный туннель через Интернет.

## Введение

Project V даёт одно кроссплатформенное ядро и разные GUI. Ядро, V2Ray, создано для подключения, маршрутизации и транспортировки данных.

Задача V2Ray - передача данных от юзера до специального сервера, основываясь на конфигурацию юзера. It runs as a commandline tool. It can be configured via JSON based configuration.

## Возможности

### Multiple proxy support

V2Ray поддерживает протоколы Socks, HTTP, Shadowsocks и VMess.

* Один процесс V2Ray может одновременно использовать разные протоколы на разных портах;
* Объединив разные входящие и исходящие прокси, можно динамически изменять формат трафика.

### Multiple transport protocols

Все указанные выше прокси могут быть отправлены / получены через TLS, TCP, mKCP и другие транспортные протоколы.

### Flexible routing

V2Ray имеет внутренний маршрутизатор, который может быть настроен на прокси-трафик или отправлен напрямую или даже заблокирован.

## Update this site

Этот сайт создан GitBook, а также хост на GitHub. Если вы хотите изменить его содержимое, отправьте запрос на pull для [ этого репо ](https://github.com/v2ray/manual).

## Лицензия

Этот веб-сайт лицензируется по лицензии [ Creative Commons Attribution 4.0 ](https://creativecommons.org/licenses/by/4.0/).