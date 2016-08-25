class Station
  include InstanceCounter
  include Validation

  @@station_list = []

  attr_reader :name

  NAME = /\D{2,}[\w+]?/i

  validate :name, :presence
  validate :type_class, :type, "Station"

  def initialize(name)
    @type_class = self.class
    @name = name
    @trains = []
    validate!
    @@station_list << self
  end

  def self.all
    @@station_list
  end

  def each_train(block)
    @trains.each do |train|
      block.call train
    end
  end

  def recept_train(train)
    @trains << train
    train.add_current_station(self)
  end

  def show_trains
    puts "Список поездов на станции #{name}:"
    @trains.each do |train|
      puts "№#{train.number}:#{Train::TYPE[train.type]}:#{train.wagons.size}ваг"
    end
  end

  def show_passenger_trains
    puts "Пассажирских поездов: #{trains_selector(:passenger)}"
  end

  def show_freight_trains
    puts "Грузовых поездов: #{trains_selector(:cargo)}"
  end

  def send_train(train)
    @trains.delete(train)
  end

  private

  def trains_selector(type)
    count = 0
    @trains.each do |train|
      count += 1 if train.type == type
    end
    count
  end
end
