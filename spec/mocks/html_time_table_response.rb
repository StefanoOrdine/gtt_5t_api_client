require 'mocks/html_time_table_dom_table'

module Mocks
  HTML_TIME_TABLE_RESPONSE = <<-HTML
<div id="infow">
<div style="margin-bottom:15px">
<img width='25' src='/5t/img/stop.png'  style='vertical-align:middle;margin-right:5px;'/><b>Fermata:
  <span style="color:#1662ad">64&nbsp;LINGOTTO EXPO</span></b>
</div>
<b>Passaggi</b>
<span style="margin-left:30px;color:#888;font-style: italic; font-size:75%"><span style="color:#1662ad; font-weight:bold">* </span> Previsione in tempo reale</span>

#{HTML_TABLE_MOCK}

</div>
  HTML
end
