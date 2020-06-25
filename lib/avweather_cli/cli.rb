class AvweatherCli::CLI
  def run
    AvweatherCli::Scraper.new.make_airports
    puts "Welcome to Aviation Weather CLI."
    menu
  end

  def menu
    puts ""
    puts "Please input the number of the airport (1-30) you would like to query."
    puts "To exit the interface, type 'exit' then press Enter."
    puts ""
    input = nil
    unless input == "exit"
      input = gets.strip.to_i
    end

    # provide input and create Airport instance from collection of Airports
    airport = AvweatherCli::Airport.find(input)
    puts "Your selected airport: #{airport.name} (#{airport.code})"
    puts airport.metar


    puts "To display the above METAR in a translated format, please select from the following (type the number displayed below, then press Enter)"
    puts ""
    puts "1. Temperature"
    puts "2. Dewpoint"
    puts "3. Altimeter setting"
    puts "4. Winds"
    puts "5. Visibility"
    puts "6. Ceiling"
    puts "7. Clouds"
    puts "8. Remarks"
    puts ""

    input = nil
    unless input == "exit"
      input = gets.strip.to_i
      case input
      when 1
        puts airport.temperature
      when 2
        puts airport.dewpoint
      when 3
        puts airport.altimeter
      when 4
        puts airport.winds
      when 5
        puts airport.visibility
      when 6
        puts airport.ceiling
      when 7
        puts airport.clouds
      when 8
        puts airport.remarks
      end
    end
  end
end