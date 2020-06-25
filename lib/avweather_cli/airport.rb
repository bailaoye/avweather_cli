class AvweatherCli::Airport
  attr_accessor :index, :name, :city, :country, :code, :doc

  @@all = []

  # this method scrapes basic information (airport name, code) and assigns each airport an index
  def self.new_from_list(rows)
    i = 0
    while i < 240
      self.new(
        rows.css('td')[i].text.to_i, # index
        rows.css('td')[i + 1].text.strip, # airport name
        rows.css('td')[i + 2].text.strip, # airport city
        rows.css('td')[i + 3].text.strip, # airport country
        rows.css('td')[i + 4].text.partition("/").last.strip # code
      )
      i += 8 # advance to next row
    end
  end

  # the initialize method assigns the information scraped earlier, and also scrapes another data source (NOAA)
  # for detailed, live weather information, which can be displayed by the user
  def initialize(index, name, city, country, code)
    @index = index
    @name = name
    @city = city
    @country = country
    @code = code
    @doc = Nokogiri::HTML(open("https://www.aviationweather.gov/adds/tafs/?station_ids=#{code}&std_trans=translated&submit_both=Get+TAFs+and+METARs"))
    @@all << self
  end

  def self.all
    @@all
  end

  # this method retrieves the index number and name for each airport in @@all, and puts them to console
  def self.list(rows)
    self.all.each do |index, name|
      puts "#{@index}. #{@name}"
    end
  end

  def self.doc
    @doc
  end

  def self.index
    @index
  end

  def self.name
    @name
  end

  def self.code
    @code
  end

  def self.find(index)
    self.all[index-1]
  end

  # the METAR is an abbreviated weather report used in aviation
  def metar
    puts ""
    puts "Time of last report : #{@doc.css("table td")[5].text.partition("observed").last.strip}"
    puts "  #{@doc.css("tr, td")[6].text.strip}"
  end

  def temperature
    puts ""
    puts "Temperature: #{@doc.css("table td")[7].text.strip}"
  end

  def dewpoint
    puts ""
    puts "Dewpoint: #{@doc.css("table td")[9].text.strip}"
  end

  def altimeter
    puts ""
    puts "Altimeter setting: #{@doc.css("table td")[11].text.strip}"
  end

  def winds
    puts ""
    puts "Winds: #{@doc.css("table td")[13].text.strip}"
  end

  def visibility
    puts ""
    puts "Visibility: #{@doc.css("table td")[15].text.strip}"
  end

  def ceiling
    puts ""
    puts "Ceiling: #{@doc.css("table td")[17].text.strip}"
  end

  def clouds
    puts ""
    puts "Clouds: #{@doc.css("table td")[19].text}"
  end

  def remarks
    puts ""
    puts "Remarks: #{@doc.css("table td")[21].text.strip}"
  end

  def metar_all
    temperature
    dewpoint
    altimeter
    winds
    visibility
    ceiling
    clouds
    remarks
  end

end