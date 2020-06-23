class AvweatherCli::Scraper

    def self.get_page(input)
        puts "scraping..."
        doc = Nokogiri::HTML(open("https://www.aviationweather.gov/adds/tafs/?station_ids=#{input}&std_trans=translated&submit_both=Get+TAFs+and+METARs"))
        puts doc.css("table tr td")[1].text
    end

end