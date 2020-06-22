class AvweatherCli::Airport
  def initialize(icao_code)
    @icao_code = icao_code
  end

  def self.icao_code
    @icao_code
  end
end