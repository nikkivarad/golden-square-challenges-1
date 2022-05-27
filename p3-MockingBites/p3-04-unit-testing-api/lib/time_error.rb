require 'date'
require 'json'
require 'net/http'

class TimeError
  # The below are added
  def initialize(get_server)
    @get_server = get_server
  end

  # The above are added
  
  # Returns difference in seconds between server time
  # and the time on this computer
  def error(current_time)
    return get_server_time - current_time # replaces Time.now
  end

  private

  def get_server_time
    # text_response = Net::HTTP.get(URI("https://worldtimeapi.org/api/ip"))
    text_response = @get_server.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end