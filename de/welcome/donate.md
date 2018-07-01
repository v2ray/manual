# Spende

[![English](../resources/english.svg)](https://www.v2ray.com/en/welcome/donate.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/02_donate.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/welcome/donate.html) [![Translate](../resources/lang.svg)](https://crowdin.com/project/v2ray)

Projekt V ist ein gemeinnütziges Projekt. Der Quellcode und das Programm können frei unter MIT Lizenz verwendet werden. Wenn Sie dieses Projekt mögen, können Sie uns eine Tasse Kaffee kaufen.

Anmerkungen:

* Die Verwendung von Spenden wird nicht veröffentlicht.
* Ihre Spende hat keine direkte Verbindung zur Entwicklung und zum Service von Project V.
* Danke für das liebevolle Projekt V.

## Der übliche Weg

Betrag: <input id="damount" type="number" min="1" step="any" value="25" />USD

\ * Spenden, die weniger als 1 USD betragen, können aufgrund hoher Servicegebühren zurückerstattet werden und werden nicht in der unten aufgeführten Sponsorenliste aufgeführt. 

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

 

Spenden über: <input type="button" value="Paypal" onclick="doPaypalMe(event);" /> <input type="button" value="Kreditkarte" onclick="doPaypal(event);" />

## Kryptowährung

* Bitcoin: [15dQnC9yvX6JJXaFkP9MiRYvJS3FvsqvKW](https://blockchain.info/address/15dQnC9yvX6JJXaFkP9MiRYvJS3FvsqvKW)
* Bitcoin-Fall: [1NNRgpWYD8UX1bkcokCEoD6HHpaw98onxa](https://blockdozer.com/insight/address/1NNRgpWYD8UX1bkcokCEoD6HHpaw98onxa)
* Ethereum: [0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e](https://etherscan.io/address/0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e)
* Litecoin: [LVdeH2HkCgGRs8ZEpan7fkAEEPbiJ4McoR](https://insight.litecore.io/address/LVdeH2HkCgGRs8ZEpan7fkAEEPbiJ4McoR)
* Monero: 48kA4NyLRCWQvB7U2A77G66Z25uWbyzmoZSYjxJfrMR1J4dRFW6fWFLDn3wirAqP8ySnR4rnvoXWxfkNFhrK5ZxY1WyBqKg
* EOS: [0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e](https://etherscan.io/token/EOS?a=0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e)
* OMG: [0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e](https://etherscan.io/token/OmiseGo?a=0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e)