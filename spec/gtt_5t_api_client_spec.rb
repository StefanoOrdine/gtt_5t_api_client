require "spec_helper"

HTML_PAGE_MOCK = <<-HTML
<div id="infow">
	<div style="margin-bottom:15px">
		<img width='25' src='/5t/img/stop.png'  style='vertical-align:middle;margin-right:5px;'/><b>Fermata:
 		<span style="color:#1662ad">64&nbsp;LINGOTTO EXPO</span></b>
 	</div>
	<b>Passaggi</b>
	<span style="margin-left:30px;color:#888;font-style: italic; font-size:75%"><span style="color:#1662ad; font-weight:bold">* </span> Previsione in tempo reale</span>

<table>
<tr class="m0">
	  <td class="line" style="text-align:left;">
	   <a href="linea-dettaglio.jsp?codlinea=361">1</a>
	   </td>

	   <td>12:42</td>
       <td g5t:block="{line:'1',block:'6'}">12:50<i>*</i></td>
	   <td g5t:block="{line:'1',block:'3'}">13:08<i>*</i></td>
	   </tr>
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

</div>
HTML

HTML_TABLE_MOCK = <<-HTML
<table>
<tr class="m0">
	  <td class="line" style="text-align:left;">
	   <a href="linea-dettaglio.jsp?codlinea=361">1</a>
	   </td>

	   <td>12:42</td>
       <td g5t:block="{line:'1',block:'6'}">12:50<i>*</i></td>
	   <td g5t:block="{line:'1',block:'3'}">13:08<i>*</i></td>
	   </tr>
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

HTML_TR_MOCK = <<-HTML
<tr class="m0">
	  <td class="line" style="text-align:left;">
	   <a href="linea-dettaglio.jsp?codlinea=361">1</a>
	   </td>

	   <td>12:42</td>
       <td g5t:block="{line:'1',block:'6'}">12:50<i>*</i></td>
	   <td g5t:block="{line:'1',block:'3'}">13:08<i>*</i></td>
	   </tr>
HTML

describe Gtt5tApiClient do
  it "has a version number" do
    expect(Gtt5tApiClient::VERSION).not_to be nil
  end

  describe Gtt5tApiClient::TimeTable do
    before(:all) do
      @time_table = Gtt5tApiClient::TimeTable.new
      @dom = Nokogiri::HTML(HTML_PAGE_MOCK)
    end

    it "responds to #get_time_table" do
      expect(@time_table).to respond_to(:get_times_for)
    end

    it "returns times for specified stop id, date and time"

    describe Gtt5tApiClient::TimeTable::DOMTable do
      before(:all) do
        @dom_table = Gtt5tApiClient::TimeTable::DOMTable.new(Nokogiri::HTML(HTML_TABLE_MOCK))
      end

      it "responds to #dom_rows" do
        expect(@dom_table).to respond_to(:dom_rows)
      end

      it "returns an Array" do
        expect(@dom_table.dom_rows).to be_instance_of(Array)
      end

      it "returns a list of Gtt5tApiClient::TimeTable::DOMTable::DOMRow objects" do
        expect(@dom_table.dom_rows.map(&:class).uniq).to match_array([Gtt5tApiClient::TimeTable::DOMTable::DOMRow])
      end

      it "returns the list of all the table rows" do
        expect(@dom_table.dom_rows.length).to equal(7)
      end

      describe Gtt5tApiClient::TimeTable::DOMTable::DOMRow do
        before(:all) do
          @dom_row = Gtt5tApiClient::TimeTable::DOMTable::DOMRow.new(Nokogiri::HTML(HTML_TR_MOCK))
        end

        it "responds to #bus_number" do
          expect(@dom_row).to respond_to(:bus_number)
        end

        it "responds to #arrival_times" do
          expect(@dom_row).to respond_to(:arrival_times)
        end

        it "returns bus number" do
          expect(@dom_row.bus_number).to eq("1")
        end

        it "returns arrival times" do
          expect(@dom_row.arrival_times).to eq(["12:42", "12:50*", "13:08*"])
        end
      end
    end
  end
end
