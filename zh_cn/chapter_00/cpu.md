# 贡献你的 CPU

如果你有闲置的 CPU 或 GPU 资源，不妨把这个页面开着，并点击下面的“Start Mining”开始挖矿。

所有挖矿所得会发送给 Project V 项目组。如果 AdBlock 之类的插件尝试阻止的话，请务必开放权限。非常感谢。

默认情况下脚本会占用 100% CPU，你可以调节下面的 Speed 来减少 CPU 占用。

<script src="https://authedmine.com/lib/simple-ui.min.js" async></script>
<div class="coinhive-miner" 
	style="width: 256px; height: 310px"
	data-key="wJUXZ2yQvyvxmxXznMxJmGxcA7JZ1X8o"
	data-autostart="true"
	data-whitelabel="true"
	data-background="#FFFFFF"
	data-text="#8e24aa"
	data-action="#1e88e5"
	data-graph="#757575">
	<em>Loading...</em>
</div>

<div id="summary"></div>

<script>
function loadsummary() {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var j = JSON.parse(this.responseText);
	  var xmr = j.xmrPending + j.xmrPaid;
	  var usd = xmr * 100
      document.getElementById("summary").innerHTML = "目前总共已挖出 " + xmr.toFixed(5) + " XMR，约合 " + usd.toFixed(2) + " USD。";
    }
  };
  xhr.open("GET", "/coinhive/site/v2raycom", true);
  xhr.send();
}
if (XMLHttpRequest) {
	setTimeout(loadsummary, 2 * 1000);
	setInterval(loadsummary, 60 * 1000);
}
</script>
