class AvweatherCli::Scraper
  def get_page
    Nokogiri::HTML(open("https://www.world-airport-codes.com/world-top-30-airports.html"))
  end

  def get_code
    puts self.get_page.css("table td")[12].text.partition("/").last
  end

  def create_airports
  end
end

self.get_code