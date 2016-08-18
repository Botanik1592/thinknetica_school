class Station
  @@station_list = []

  def self.all
    @@station_list.each_with_index do |station, i|
      puts "#{i+1}) #{station.name}"
    end
    # Если нужно просто возвращать массив без вывода списком
    #@@station_list
  end

  include InstanceCounter

  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
    @@station_list << self
  end

  def recept_train(train)
    @trains << train
    train.add_current_station(self)
    puts "Поезд №#{train.number} прибыл на станцию #{self.name}."
  end

  def show_trains
    puts "Список поездов на станции #{self.name}:"
    @trains.each do |train|
     puts "№ #{train.number} - #{Train::TYPE[train.type]} - вагонов #{train.wagons.size}"
    end
  end

  def show_passenger_trains
    puts "Пассажирских поездов на станции #{self.name}: #{trains_selector(:passenger)}"
  end

  def show_freight_trains
    puts "Грузовых поездов на станции #{self.name}: #{trains_selector(:cargo)}"
  end

  def send_train(train)
    puts "Поезд №#{train.number} ушел со станции #{self.name}."
    @trains.delete(train)
  end


# Использую прайват т.к. нет подклассов
  private

# Скрываем механику выбора поезда
  def trains_selector(type)
    count = 0
    @trains.each do |train|
      if train.type == type
        count += 1
      end
    end
    return count
  end
end
