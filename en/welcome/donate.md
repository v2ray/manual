# Donation

![English](../resources/englishc.svg) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/02_donate.html)

Project V is a nonprofit project. The source code and program can be used freely under MIT licence. If you like this project, you may buy us a cup of coffee.

Notes:

* The usage of donations will not be published.
* Your donation has no direct connection to Project V's development and service.
* All donations are listed below with sensitive information masked out. If you wish to be listed in other ways, please mention it when making the donation.
* Thank you for loving Project V.

## The Usual Way

Amount: <input id="damount" type="number" min="1" step="any" value="25" />USD

\* Donations that less than 1 USD may be refunded due to high service fees.

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

## Cryptocurrency

* Bitcoin: [15DumaY9Pc3CRf2uKTXAp4R21sEkymvpJo](https://blockchain.info/address/15DumaY9Pc3CRf2uKTXAp4R21sEkymvpJo)
* Bitcoin Case: [1473sDqeigUEdctzexUhxjBAiGizsS5tjD](https://blockdozer.com/insight/address/1473sDqeigUEdctzexUhxjBAiGizsS5tjD)
* Ethereum: [0x2d2306cDB993f3db217141EbDc5AF4fc54150c2b](https://etherscan.io/address/0x2d2306cDB993f3db217141EbDc5AF4fc54150c2b)
* Monero: 48kA4NyLRCWQvB7U2A77G66Z25uWbyzmoZSYjxJfrMR1J4dRFW6fWFLDn3wirAqP8ySnR4rnvoXWxfkNFhrK5ZxY1WyBqKg

## Thank you for your donation

The list is updated on average once every week. Please be patient to see your name.

{% include "../donor.md" %}
