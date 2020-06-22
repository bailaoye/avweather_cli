class AvweatherCli::Scraper

    def get_page
        puts "scraping..."
        Nokogiri::HTML(open("https://flightaware.com/resources/airport/CYVR/weather"))
    end
    
    def scrape_wind
    end

    def scrape_visibility
    end

end