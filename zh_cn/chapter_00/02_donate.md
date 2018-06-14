# 资助 V2Ray 发展

![Chinese](../resources/chinesec.svg) [![English](../resources/english.svg)](https://www.v2ray.com/en/welcome/donate.html)

Project V 是一个非营利项目，它的所有代码均公开，软件可以自由使用，不受限制。如果您喜爱本项目，可以通过下面的方式请作者喝一杯咖啡。

一些说明：

* 所有捐款的用途将不被公开；
* 您的捐款是对 Project V 的无偿贡献，和 Project V 提供的技术和服务没有直接关联；
* 您捐赠的款项会在本页下方列出，敏感信息已做处理，如果您希望已其它的方式公布，请在捐赠时留言；
* 感谢您对 Project V 的热爱。

## 传统方式

捐赠金额：<input id="damount" type="number" min="1" step="any" value="25" />美元

\* 由于平台的关系，小于 1 美元的捐赠可能会全部用于支付手续费而变得没有意义，对于这类捐赠会直接发起退款，且不会列在捐款人列表中。

<!--
<script src="https://js.stripe.com/v3/"></script>
-->
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

// function doStripe(event) {
//   event.preventDefault();
//   var amt = parseInt(getAmount(), 10);
//   if (!amt) {
//     amt = 25;
//   }
//   amt = amt * 85;
//   var stripe = Stripe('pk_live_gnBpo8a9p6mluv62soVQtjic');
//   stripe.createSource({
//     type: 'alipay',
//     amount: amt,
//     currency: 'eur',
//     redirect: {
//         return_url: 'https://www.v2ray.com/chapter_00/02_donate.html'
//     },
//     }).then(function(result) {
//       console.log(result);
//       var src = result.source;
//       if (src && src.redirect && src.redirect.url) {
//         document.location.href=src.redirect.url;
//       }
//     });
// }

</script>

支付方式：<input type="button" value="Paypal" onclick="doPaypalMe(event);" /> <input type="button" value="信用卡" onclick="doPaypal(event);" />

<form id="paypalform" action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input id="paypalamount" type="hidden" name="amount" value="25">
<input type="hidden" name="currency_code" value="usd">
<input type="hidden" name="hosted_button_id" value="4TU3UKYANT2WY">
</form>

## 极客方式

* 比特币 (BTC): [15dQnC9yvX6JJXaFkP9MiRYvJS3FvsqvKW](https://blockchain.info/address/15dQnC9yvX6JJXaFkP9MiRYvJS3FvsqvKW)
* 比特现金 (BCH): [1NNRgpWYD8UX1bkcokCEoD6HHpaw98onxa](https://blockdozer.com/insight/address/1NNRgpWYD8UX1bkcokCEoD6HHpaw98onxa)
* 以太坊 (ETH): [0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e](https://etherscan.io/address/0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e)
* 莱特币 (LTC): [LVdeH2HkCgGRs8ZEpan7fkAEEPbiJ4McoR](https://insight.litecore.io/address/LVdeH2HkCgGRs8ZEpan7fkAEEPbiJ4McoR)
* 门罗币 (XMR): 48kA4NyLRCWQvB7U2A77G66Z25uWbyzmoZSYjxJfrMR1J4dRFW6fWFLDn3wirAqP8ySnR4rnvoXWxfkNFhrK5ZxY1WyBqKg
* EOS: [0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e](https://etherscan.io/token/EOS?a=0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e)
* 嫩模币 (OMG): [0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e](https://etherscan.io/token/OmiseGo?a=0x196b695ce3b44c4bd16fe43981bcc908a6a09c2e)
* [贡献你的 CPU](cpu.md)
