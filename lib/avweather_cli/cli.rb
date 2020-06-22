require "nokogiri"
require_relative "./airportinfo"


class AvweatherCli::CLI
  def run
    puts "Welcome to Aviation Weather CLI.\n\nPlease note that this application only covers airports in the Greater Vancouver area. \n\nTo exit the application at any time, input 'exit'"
    menu
  end

  def menu
    puts "Enter the ICAO identifier of the airport you wish to query: "
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      airport = AvweatherCli::AirportInfo.new(input)
      puts airport.airport_name
      
    end
  end
end