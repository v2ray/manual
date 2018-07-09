# Donation

[![English][1]][2] [![Chinese][3]][4] [![German][5]][6] [![Translate][7]][8]

[1]: ../resources/english.svg
[2]: https://www.v2ray.com/en/welcome/donate.html
[3]: ../resources/chinese.svg
[4]: https://www.v2ray.com/chapter_00/02_donate.html
[5]: ../resources/german.svg
[6]: https://www.v2ray.com/de/welcome/donate.html
[7]: ../resources/lang.svg
[8]: https://crowdin.com/project/v2ray

Project V is a nonprofit project. The source code and program can be used freely under MIT licence. If you like this project, you may buy us a cup of coffee.

Notes:

* The usage of donations will not be published.
* Your donation has no direct connection to Project V's development and service.
* Thank you for loving Project V.

## The Usual Way {#usual-way}

Amount: <input id="damount" type="number" min="1" step="any" value="25" />USD

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

Donate via: <input type="button" value="Paypal" onclick="doPaypalMe(event);" /> <input type="button" value="Credit Card" onclick="doPaypal(event);" />

<form id="paypalform" action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input id="paypalamount" type="hidden" name="amount" value="25">
<input type="hidden" name="currency_code" value="usd">
<input type="hidden" name="hosted_button_id" value="4TU3UKYANT2WY">
</form>

## Cryptocurrency {#crypto}

* Bitcoin: [15dQnC9yvX6JJXaFkP9MiRYvJS3FvsqvKW](https://blockchain.info/address/15dQnC9yvX6JJXaFkP9MiRYvJS3FvsqvKW)
* Bitcoin Case: [1NNRgpWYD8UX1bkcokCEoD6HHpaw98onxa](https://blockdozer.com/insight/address/1NNRgpWYD8UX1bkcokCEoD6HHpaw98onxa)
* Ethereum: [0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e](https://etherscan.io/address/0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e)
  * Also supports these ERC20 tokens: OMG, REP, GNT, DGD
* EOS: [EOS8Civdok4CBN3jCpsaGQijzesjKof1eyaRFuBU5mLMtWVkLsy8a](https://eostracker.io/accounts/lovevictoria)
* Litecoin: [LVdeH2HkCgGRs8ZEpan7fkAEEPbiJ4McoR](https://insight.litecore.io/address/LVdeH2HkCgGRs8ZEpan7fkAEEPbiJ4McoR)
* Monero: 48kA4NyLRCWQvB7U2A77G66Z25uWbyzmoZSYjxJfrMR1J4dRFW6fWFLDn3wirAqP8ySnR4rnvoXWxfkNFhrK5ZxY1WyBqKg
