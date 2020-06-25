class AvweatherCli::Scraper
  def get_page
    Nokogiri::HTML(open("https://www.world-airport-codes.com/world-top-30-airports.html"))
  end

  def scrape_rows
    self.get_page.css("table tr")
    
  end

  def make_airports  
    AvweatherCli::Airport.new_from_list(self.scrape_rows)
  end
end

