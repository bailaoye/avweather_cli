class AvweatherCli::CLI
  def call
    puts "Welcome to Aviation Weather CLI. Please note that this application only covers airports in the Greater Vancouver area. To exit the application at any time, input 'exit'"
    puts "Airports:"
    list_airports
    menu
  end

  def list_airports
    puts "CYVR - Vancouver Intl"
    puts "CYXX - Abbotsford"
    puts "CYNJ - Langley Rgnl"
    puts "CZBB - Boundary Bay"
    puts "CYPK - Pitt Meadows"
    puts "CYCW - Chilliwack"
  end

  def menu
    puts "Enter the ICAO code of the airport you wish to query: "
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "cyvr"
        puts "More info about CYVR:"
      end
    end
  end
end