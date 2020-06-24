class AvweatherCli::Scraper
  def get_page
    Nokogiri::HTML(open("https://www.world-airport-codes.com/world-top-30-airports.html"))
  end

  def get_index
  end

  def create_airports

  end
end