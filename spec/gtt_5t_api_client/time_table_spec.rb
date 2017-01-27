require "spec_helper"

describe Gtt5tApiClient::TimeTable do
  before(:all) do
    @stop_id = 64
    @time = '12:40'
    @date = '27/01/2017'
    @datetime = DateTime.new(2017, 1, 27, 12, 40)

    @time_table = Gtt5tApiClient::TimeTable.new(@stop_id, @datetime)
  end

  before(:each) do
    stub_request(:get, "http://www.5t.torino.it/5t/trasporto/arrival-times-byline.jsp").
      with(
        :headers => {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host' => 'www.5t.torino.it',
          'User-Agent' => 'Ruby'
        },
        :query => {
          action: 'getTransitsByLine',
          gma: @date,
          oreMinuti: @time,
          shortName: @stop_id
        }
      ).
      to_return(:status => 200, :body => Mocks::HTML_TIME_TABLE_RESPONSE, :headers => {})
  end

  it "responds to #times" do
    expect(@time_table).to respond_to(:times)
  end

  it "returns times for specified stop id, date and time" do # required an http api call mock here.
    expect(@time_table.times).to eq({
      :"1" => ["12:42", "12:50*", "13:08*"],
      :"18" => ["12:40*", "12:50*", "13:00*"],
      :"2014" => ["13:33", "15:03", "15:28"],
      :"2073" => ["17:56"],
      :"24" => ["12:59"],
      :"35" => ["12:41*", "12:59*", "13:06"],
      :"93B" => ["14:31"]
    })
  end

  it "responds to #stop_name" do # required an http api call mock here.
    expect(@time_table).to respond_to(:stop_name)
  end

  it "returns the stop name" do
    expect(@time_table.stop_name).to eq('64 LINGOTTO EXPO')
  end
end
