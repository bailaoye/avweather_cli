require "nokogiri"


class AvweatherCli::CLI
  def run
    puts "Welcome to Aviation Weather CLI.\n\nTo exit the application at any time, type 'exit' then press Enter."
    menu
  end

  def menu
    puts ""
    puts "Please enter a ICAO 4-letter identifier code for the airport you wish to query: "
    puts ""
    input = nil
    unless input == "exit"
      input = gets.strip.downcase
      puts "input is #{input}"
    end

    info = AvweatherCli::Scraper.get_page(input)
    puts info
  end
end