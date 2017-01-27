require 'mocks/html_time_table_dom_row'
module Mocks
  HTML_TABLE_MOCK = <<-HTML
<table>
#{HTML_TR_MOCK}
<tr class="m1">
    <td class="line" style="text-align:left;">
     <a href="linea-dettaglio.jsp?codlinea=373">18</a>
     </td>

     <td g5t:block="{line:'18',block:'18'}">12:40<i>*</i></td>
     <td g5t:block="{line:'18',block:'35'}">12:50<i>*</i></td>
     <td g5t:block="{line:'18',block:'31'}">13:00<i>*</i></td>
     </tr>
<tr class="m0">
    <td class="line" style="text-align:left;">
     <a href="linea-dettaglio.jsp?codlinea=869">2014</a>
     </td>

     <td>13:33</td>
       <td>15:03</td>
       <td>15:28</td>
       </tr>
<tr class="m1">
    <td class="line" style="text-align:left;">
     <a href="linea-dettaglio.jsp?codlinea=875">2073</a>
     </td>

     <td>17:56</td>
       <td></td>
       <td></td>
       </tr>
<tr class="m0">
    <td class="line" style="text-align:left;">
     <a href="linea-dettaglio.jsp?codlinea=620">24</a>
     </td>

     <td>12:59</td>
       <td></td>
       <td></td>
       </tr>
<tr class="m1">
    <td class="line" style="text-align:left;">
     <a href="linea-dettaglio.jsp?codlinea=385">35</a>
     </td>

     <td g5t:block="{line:'35',block:'10'}">12:41<i>*</i></td>
     <td g5t:block="{line:'35',block:'1'}">12:59<i>*</i></td>
     <td>13:06</td>
       </tr>
<tr class="m0">
    <td class="line" style="text-align:left;">
     <a href="linea-dettaglio.jsp?codlinea=650">93B</a>
     </td>

     <td>14:31</td>
       <td></td>
       <td></td>
       </tr>
</table>
  HTML
end
