class AvweatherCli::Scraper

    def get_page(airport)
        puts "scraping..."
        Nokogiri::HTML(open("https://flightaware.com/resources/airport/#{airport}/weather"))
    end
    
    def scrape_wind
    end

    def scrape_visibility
    end

end