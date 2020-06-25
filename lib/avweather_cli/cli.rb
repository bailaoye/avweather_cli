class AvweatherCli::CLI
  def run
    AvweatherCli::Scraper.new.make_airports
    puts "Welcome to Aviation Weather CLI.\nTo exit the application at any time, type 'exit' then press Enter."
    menu
  end

  def menu
    puts ""
    puts "Please type in the number of the airport you would like to query (1-30) then press Enter."
    puts ""
    input = nil
    unless input == "exit"
      input = gets.strip.to_i
    end

  airport = AvweatherCli::Airport.find(input)
  puts airport.inspect
  



    puts "To display the above METAR in a translated format, please select from the following (type the number displayed below, then press Enter)"
    puts "1. Temperature"
    puts "2. Dewpoint"
    puts "3. Altimeter setting"
    puts "4. Winds"
    puts "5. Visibility"
    puts "6. Ceiling"
    puts "7. Clouds"
    puts "8. Remarks"

    input = nil
    unless input == "exit"
      input = gets.strip.to_i
      case input
      when 1
        puts AvweatherCli::Airport.temperature
      when 2
        puts AvweatherCli::Airport.dewpoint
      when 3
        puts AvweatherCli::Airport.altimeter
      when 4
        puts AvweatherCli::Airport.winds
      when 5
        puts AvweatherCli::Airport.visibility
      when 6
        puts AvweatherCli::Airport.ceiling
      when 7
        puts AvweatherCli::Airport.clouds
      when 8
        puts AvweatherCli::Airport.remarks
      else
        puts "Invalid input, please try again."
      end
    end
  end
end