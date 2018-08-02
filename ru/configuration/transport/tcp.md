# Доставка через TCP

[![Английский](../../resources/english.svg)](https://www.v2ray.com/en/configuration/transport/tcp.html) [![Китайский](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/transport/tcp.html) [![Немецкий](../../resources/german.svg)](https://www.v2ray.com/de/configuration/transport/tcp.html) [![Русский](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/transport/tcp.html)

Конфигурация:

```javascript
{
  "header": {
    "type": "none"
  }
}
```

Где:

* `header`: Настройки обфускации заголовка: 
  * `type`: Тип обфускации. Варианты: 
    * `"none"`: Значение по умолчанию. Без обфускации.
    * `"http"`: HTTP обфускация. Смотри ниже.

## Обфускация HTTP

Обфускацию HTTP необходимо настроить (и сопоставить) для входящих и исходящих соединений.

```javascript
{
  "type": "http",
  "request": {
    "version": "1.1",
    "method": "GET",
    "path": ["/"],
    "headers": {
      "Host": ["www.baidu.com", "www.bing.com"],
      "User-Agent": [
        "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_0_2 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/53.0.2785.109 Mobile/14A456 Safari/601.1.46"
      ],
      "Accept-Encoding": ["gzip, deflate"],
      "Connection": ["keep-alive"],
      "Pragma": "no-cache"
    }
  },
  "response": {
    "version": "1.1",
    "status": "200",
    "reason": "OK",
    "headers": {
      "Content-Type": ["application/octet-stream", "video/mpeg"],
      "Transfer-Encoding": ["chunked"],
      "Connection": ["keep-alive"],
      "Pragma": "no-cache"
    }
  }
}
```

Где:

* `type`: тот же `type` что и в `tcpSettings`.
* `request`: Настройки HTTP-запроса: 
  * `version`: Версия HTTP, по умолчанию `"1.1"`
  * `method`: Метод HTTP, по умолчанию `"GET"`
  * `path`: Путь. Массив строк. Значение по умолчанию `["/"]`. Если включает несколько элементов, значение выбирается случайным образом для каждого запроса.
  * `headers`: Заголовки HTTP. Ассоциативный массив, пары ключ-значение. Каждый ключ - заголовок HTTP, а каждое значение - содержимое HTTP заголовка. Если задано несколько элементов, конечные заголовки выбираются случайным образом для каждого запроса. Параметры по умолчанию - в примере выше.
* `response`: Ответ HTTP. 
  * `version`: Версия HTTP. По умолчанию `"1.1"`.
  * `status`: Статус HTTP. По умолчанию `"200"`.
  * `reason`: Текст статуса HTTP. По умолчанию `"OK"`.
  * `headers`: Заголовки HTTP. Same as request headers, but for response.