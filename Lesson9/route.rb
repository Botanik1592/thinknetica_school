class Route
  include Validation

  attr_reader :route

  NAME = /\D{2,}[\w+]?[-].\D{2,}[\w+]?/i

  validate :name, :presence
  validate :type_class, :type, "Route"

  def initialize(first, last, name)
    @type_class = self.class
    @first = first
    @last = last
    @name = name
    validate!
    @route = [@first, @last]
  end

  # def valid?
  #   validate!
  # rescue
  #   false
  # end

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

  # def validate!
  #   raise 'Название не может быть пустым!' if @name.nil?
  #   raise 'Формат названия: ПерваяСтанция-ПоследняяСтанция' if @name !~ NAME
  #   true
  # end
end
