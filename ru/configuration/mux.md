---
refcn: chapter_02/mux
refen: configuration/mux
---
# Мультиплексирование

Мультиплексирование или Mux - это использование одного физического TCP-соединения для нескольких виртуальных TCP-соединений.

Мультиплексирование предназначено для уменьшения задержек при хендшейке (установлении соединения) TCP. Это делается НЕ для повышения пропускной способности. При загрузке больших файлов или измерении скорости, Mux обычно медленнее, чем нормальное TCP-подключение.

## MuxObject

```javascript
{
  "enabled": false,
  "concurrency": 8
}
```

> `enabled`: true | false

Whether or not to enable Mux on an outbound.

> `concurrency`: number

Max number of multiplexed connections that one physical connection can handle at a time. Max value `1024`, min value `1`, default `8`.