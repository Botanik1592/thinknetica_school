class Station

  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def recept_train(train)
    @trains << train
    train.current_station = self
    puts "Поезд № #{train.number} прибыл на станцию #{@name}."
  end

  def show_trains
    puts "Список поездов на станции #{@name}:"
    @trains.each_with_index do |train, i|
      puts "№ #{train.number} - #{train.type} - вагонов #{train.wagons_count}"
    end
  end

# Да, можно было бы сделать один метод, в который бы передавался тип поезда, и тогда бы
# мы отображали их список, но мое решение в данной ситауции считаю более правильным,
# т.к. оно нагляднее. Внизу в комментариях я привожу метод из ТЗ

  def show_passenger_trains
    puts "Пассажирских поездов на станции #{@name}: #{trains_selector(:passenger)}"
  end

  def show_freight_trains
    puts "Грузовых поездов на станции #{@name}: #{trains_selector(:cargo)}"
  end

  def send_train(train)
    puts "Поезд № #{train.number} ушел со станции #{@name}."
    @trains.delete(train)
  end

  protected

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


#
# Вариант реализации одним методом, но он мне не нравится, т.к. нужно передавать
# параметры, а хотелось сделать вызов без параметров.
# Криво объяснил, но как-то так )))
#
#def show_trains(type="all")
#  count = 0
#  if type = "all"
#    puts "Список поездов на станции #{@name}:"
#    @trains.each_with_index do |train, i|
#      puts "№ #{train.number} - #{train.type}"
#    end
#  elsif type = "пассажирский"
#    puts "Список пассажирских поездов на станции #{@name}:"
#    @trains.each do |train|
#      if train.type == type
#        puts "№ #{train.number} - #{train.type}"
#        count += 1
#      end
#    end
#    puts "Итого: #{count}"
#  elsif type = "грузовой"
#    puts "Список грузовых поездов на станции #{@name}:"
#    @trains.each do |train|
#      if train.type == type
#        puts "№ #{train.number} - #{train.type}"
#        count += 1
#      end
#    end
#    puts "Итого: #{count}"
#  else
#    puts "Неверный тип поезда!"
#  end
#end
