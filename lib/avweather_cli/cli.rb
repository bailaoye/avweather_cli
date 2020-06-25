class AvweatherCli::CLI
  def run
    AvweatherCli::Scraper.new.make_airports
    puts "\nWelcome to Aviation Weather CLI.\n"
    puts "\nList of top 30 airports by passenger turnover:\n"
    AvweatherCli::Airport.all.each do |airport|
      puts "#{airport.index}. #{airport.name}"
    end
    menu
  end

  def menu    
    puts "\nPlease input the rank of the airport you would like to query.\n"
    input = nil
    unless input == "exit"
      input = gets.strip.to_i
    end

    # provide input and get Airport instance at index=input from collection of Airports
    airport = AvweatherCli::Airport.find(input)
    puts "Your selected airport:"
    puts "##{airport.index}. #{airport.name} (#{airport.code})"
    puts "#{airport.city}, #{airport.country}"
    puts airport.metar


    puts "To display the above METAR in a translated format, please select from the following: \n(to select, type the number displayed below, then press Enter)"
    puts "\n1. Temperature\n2. Dewpoint\n3. Altimeter setting\n4. Winds\n5. Visibility\n6. Ceiling\n7. Clouds\n8. Remarks\n"

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