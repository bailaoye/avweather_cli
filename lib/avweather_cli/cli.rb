require "nokogiri"
require_relative "./airportinfo"


class AvweatherCli::CLI
  def run
    puts "Welcome to Aviation Weather CLI.\n\nTo exit the application at any time, input 'exit'"
    menu
  end

  def menu
    puts ""
    puts "Please choose an airport to query by inputting its 4-character ICAO code (e.g. KSEA for Seattle-Tacoma)."
    puts ""
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      airport = AvweatherCli::AirportInfo.new(input)
      airport.icao_code
    end

  end
end