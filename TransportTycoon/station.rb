class Station

  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def recept_train(train)
    @trains << train
    add_current_station!(train)
    puts "Поезд №#{train.number} прибыл на станцию #{self.name}."
  end

  def show_trains
    puts "Список поездов на станции #{self.name}:"
    show_trains!
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

# Скрываем механику показа всех поездов на станции
  def show_trains!
  @trains.each do |train|
    puts "№ #{train.number} - #{Train::TYPE[train.type]} - вагонов #{train.wagons.size}"
  end
  end

# Скрываем процедуру обновления текущей станции у поезда
  def add_current_station!(train)
    train.add_current_station(self)
  end

end
