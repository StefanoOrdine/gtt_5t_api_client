require "spec_helper"

describe Gtt5tApiClient::TimeTable::DOMTable do
  before(:all) do
    @dom_table = Gtt5tApiClient::TimeTable::DOMTable.new(
      Nokogiri::HTML(Mocks::HTML_TABLE_MOCK)
    )
  end

  it "responds to #times" do
    expect(@dom_table).to respond_to(:times)
  end

  it "returns an Array of #times" do
    expect(@dom_table.times).to be_instance_of(Hash)
  end

  it "returns the list of all the table rows" do
    expect(@dom_table.times.length).to equal(7)
  end

  it "returns the hash serialization of the table" do
    expect(@dom_table.times).to eq({
      :"1" => ["12:42", "12:50*", "13:08*"],
      :"18" => ["12:40*", "12:50*", "13:00*"],
      :"2014" => ["13:33", "15:03", "15:28"],
      :"2073" => ["17:56"],
      :"24" => ["12:59"],
      :"35" => ["12:41*", "12:59*", "13:06"],
      :"93B" => ["14:31"]
    })
  end
end
