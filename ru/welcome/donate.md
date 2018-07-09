# Пожертвование

[![English](../resources/english.svg)](https://www.v2ray.com/en/welcome/donate.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/02_donate.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/welcome/donate.html) [![Перевод](../resources/lang.svg)](https://crowdin.com/project/v2ray)

Project V - некоммерческий проект. Исходный код и программа могут свободно использоваться по лицензии MIT. Если вам нравится этот проект, купите нам чашку кофею.

Примечания:

* Отчёт о расходах публиковаться не будет.
* Ваше пожертвование не имеет прямой связи с разработкой и обслуживанием Project V.
* Спасибо, что любите Project V.

## Обычный способ {#usual-way}

Сумма: <input id="damount" type="number" min="1" step="any" value="25" />USD

\* Donations that less than 1 USD may be refunded due to high service fees, and will not be listed in the sponsor list below. 

<script>
function getAmount() {
    var e = document.getElementById('damount');
    return e.value;
}

function doPaypal(event) {
  event.preventDefault();
  document.getElementById('paypalamount').value = getAmount();
  document.getElementById('paypalform').submit();
}

function doPaypalMe(event) {
  event.preventDefault();
  document.location.href='https://www.paypal.me/ProjectV2Ray/' + getAmount();
}

</script>

 

Пожертвовать через: <input type="button" value="Paypal" onclick="doPaypalMe(event);" /> <input type="button" value="Credit Card" onclick="doPaypal(event);" />

## Криптовалюта {#crypto}

* Bitcoin: [15dQnC9yvX6JJXaFkP9MiRYvJS3FvsqvKW](https://blockchain.info/address/15dQnC9yvX6JJXaFkP9MiRYvJS3FvsqvKW)
* Bitcoin Case: [1NNRgpWYD8UX1bkcokCEoD6HHpaw98onxa](https://blockdozer.com/insight/address/1NNRgpWYD8UX1bkcokCEoD6HHpaw98onxa)
* Ethereum: [0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e](https://etherscan.io/address/0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e)
* Litecoin: [LVdeH2HkCgGRs8ZEpan7fkAEEPbiJ4McoR](https://insight.litecore.io/address/LVdeH2HkCgGRs8ZEpan7fkAEEPbiJ4McoR)
* Monero: 48kA4NyLRCWQvB7U2A77G66Z25uWbyzmoZSYjxJfrMR1J4dRFW6fWFLDn3wirAqP8ySnR4rnvoXWxfkNFhrK5ZxY1WyBqKg
* EOS: [0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e](https://etherscan.io/token/EOS?a=0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e)
* OMG: [0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e](https://etherscan.io/token/OmiseGo?a=0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e)