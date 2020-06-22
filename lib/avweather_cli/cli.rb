require "nokogiri"


class AvweatherCli::CLI
  def run
    puts "Welcome to Vancouver Aviation Weather CLI.\n\nTo exit the application at any time, input 'exit'"
    menu
  end

  def menu
    puts "Current conditions at Vancouver International Airport: "
    puts ""
    puts "Available METARs"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      airport = AvweatherCli::Airport.new(input)
      puts "You've selected #{airport.icao_code}."
    end

  end
end