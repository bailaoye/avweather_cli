require_relative "./airports"
require "nokogiri"


class AvweatherCli::CLI
  def run
    puts "Welcome to Aviation Weather CLI. Please note that this application only covers airports in the Greater Vancouver area. To exit the application at any time, input 'exit'"
    list_airports
    menu
  end

  def list_airports
    @airports = AvweatherCli::Airports.list
  end

  def menu
    puts "Enter the ICAO code of the airport you wish to query: "
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "cyxx"

      when "czbb"

      when "cycw"

      when "cynj"

      when "cypk"

      when "cyvr"
        puts "You have selected Vancouver International Airport."      
      end
    end
  end
end