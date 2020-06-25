class AvweatherCli::Scraper
  def get_page
    Nokogiri::HTML(open("https://www.world-airport-codes.com/world-top-30-airports.html"))
  end

  def get_rows
    self.get_page.css("table tr")
  end

  def make_airports
    i = 0
    while i < 240
      AvweatherCli::Airport.new(
        self.get_rows.css('td')[i].text.to_i, #index
        self.get_rows.css('td')[i + 1].text.strip #airport name
        self.get_rows.css('td')[i + 4].text.partition("/").last.strip #code
      )
      i += 8
    end
  end
end

