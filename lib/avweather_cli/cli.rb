class AvweatherCli::CLI
  def call
    puts "Welcome to Aviation Weather CLI."
    puts "Airports:"
    list_airports
  end

  def list_airports
    puts "CYXX - Abbotsford"
    puts "CYNJ - Langley Rgnl"
    puts "CZBB - Boundary Bay"
  end
end