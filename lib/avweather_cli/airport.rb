class AvweatherCli::Airport
  attr_accessor :icao_code

  def self.load_airport(icao_code)
    
  end

  def initialize(icao_code)
    @icao_code = icao_code
  end
end