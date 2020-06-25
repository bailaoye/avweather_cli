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