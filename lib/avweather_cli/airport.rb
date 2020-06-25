class AvweatherCli::Airport
  attr_accessor :index, :name, :code

  @@all = []

  def self.new_from_list(rows)
    i = 0
    while i < 240
      self.new(
        rows.css('td')[i].text.to_i, #index
        rows.css('td')[i + 1].text.strip, #airport name
        rows.css('td')[i + 4].text.partition("/").last.strip #code
      )
      i += 8
    end
  end

  def initialize(index=nil, name=nil, code=nil)
    @index = index
    @name = name
    @code = code
    @@all << self
  end

  def self.all
    @@all
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

  # grabs finer airport weather details from ADDS
  def self.get_airport_details(code)
    @doc = Nokogiri::HTML(open("https://www.aviationweather.gov/adds/tafs/?station_ids=#{@code}&std_trans=translated&submit_both=Get+TAFs+and+METARs"))
    puts "METAR raw data: #{@doc.css("tr, td")[6].text.strip}"
    puts "Airport and Time of Report: #{@doc.css("table td")[5].text.strip}"
  end

  def self.temperature
    puts ""
    puts "Temperature: #{@doc.css("table td")[7].text.strip}"
  end

  def self.dewpoint
    puts ""
    puts "Dewpoint: #{@doc.css("table td")[9].text.strip}"
  end

  def self.altimeter
    puts ""
    puts "Altimeter setting: #{@doc.css("table td")[11].text.strip}"
  end

  def self.winds
    puts ""
    puts "Winds: #{@doc.css("table td")[13].text.strip}"
  end

  def self.visibility
    puts ""
    puts "Visibility: #{@doc.css("table td")[15].text.strip}"
  end

  def self.ceiling
    puts ""
    puts "Ceiling: #{@doc.css("table td")[17].text.strip}"
  end

  def self.clouds
    puts ""
    puts "Clouds: #{@doc.css("table td")[19].text}"
  end

  def self.remarks
    puts ""
    puts "Remarks: #{@doc.css("table td")[21].text.strip}"
  end

end