class Route
  attr_reader :route

  NAME = /\D{2,}[\w+]?[-].\D{2,}[\w+]?/i

  def initialize(first, last, name)
    @first = first
    @last = last
    @name = name
    validate!
    @route = [@first, @last]
  end

  def valid?
    validate!
  rescue
    false
  end

  def add_station(station)
    @route.insert(-2, station)
  end

  def remove_station(station)
    @route.delete(station)
  end

  def show_route
    @route.each_with_index do |station, i|
      puts "#{i + 1}) #{station.name}"
    end
  end

  private

  def validate!
    raise 'Название не может быть пустым!' if @name.nil?
    raise 'Название должно начинаться с имени первой станции, содержать тире и название последней станции на маршруте!' if @name !~ NAME
    true
  end
end
