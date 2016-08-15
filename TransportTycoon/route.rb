class Route

  attr_reader :route

  def initialize(first, last)
    @first = first
    @last = last
    @route = [@first, @last]
  end

  def add_station(station)
    @route.insert((@route.size - 1), station)
  end

  def remove_station(station)
    @route.delete(station)
  end

  def show_route
    @route.each_with_index do |station, i|
      puts "#{i+1}) #{station.name}"
    end
  end
end
