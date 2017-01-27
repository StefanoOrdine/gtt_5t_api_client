require "spec_helper"

describe Gtt5tApiClient::TimeTable::DOMRow do
  before(:all) do
    @dom_row = Gtt5tApiClient::TimeTable::DOMRow.new(Nokogiri::HTML(Mocks::HTML_TR_MOCK))
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
