require 'time_error'

RSpec.describe TimeError do
  context "unit testing - mocking api" do
    it "returns the difference in time" do
      time_server_double = double :time_server
      expect(time_server_double).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"BST","client_ip":"82.0.113.200","datetime":"2022-05-24T20:17:17.939701+01:00","day_of_week":2,"day_of_year":144,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1653419837,"utc_datetime":"2022-05-24T19:17:17.939701+00:00","utc_offset":"+01:00","week_number":21}')
      current_time = Time.new(2022, 5, 24, 20, 17, 17)
      time_error = TimeError.new(time_server_double)
      expect(time_error.error(current_time)).to eq 0.939701
    end
  end

  context "unit testing - real connection" do
    xit "returns difference in time" do
      time_error = TimeError.new(Net::HTTP)
      expect(time_error.error).to eq 0.939701
    end
  end
end

# {"abbreviation":"BST","client_ip":"82.0.113.200","datetime":"2022-05-24T20:17:17.939701+01:00","day_of_week":2,"day_of_year":144,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1653419837,"utc_datetime":"2022-05-24T19:17:17.939701+00:00","utc_offset":"+01:00","week_number":21}%