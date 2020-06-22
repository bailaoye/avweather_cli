class AvweatherCli::AirportInfo
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def airport_name
    print @name
  end

end