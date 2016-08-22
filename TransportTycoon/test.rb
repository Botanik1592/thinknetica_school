require "./manufacturer.rb"
require "./instance_counter.rb"
require "./train.rb"
require "./passenger_train.rb"
require "./cargo_train.rb"
require "./wagon.rb"
require "./passenger_wagon.rb"
require "./cargo_wagon.rb"
require "./station.rb"
require "./route.rb"

# Создаем станции
st1 = Station.new ("Питер")
st2 = Station.new ("Москва")

# Создаем поезда
tr = PassengerTrain.new ("111-22")
tr2 = CargoTrain.new ("111-33")
tr3 = PassengerTrain.new ("111-44")

# Создаем вагоны
pw1 = PassengerWagon.new
pw2 = PassengerWagon.new
pw3 = PassengerWagon.new
pw4 = PassengerWagon.new
pw5 = PassengerWagon.new

pw6 = PassengerWagon.new
pw7 = PassengerWagon.new
pw8 = PassengerWagon.new
pw9 = PassengerWagon.new
pw10 = PassengerWagon.new

cw1 = CargoWagon.new
cw2 = CargoWagon.new
cw3 = CargoWagon.new
cw4 = CargoWagon.new
cw5 = CargoWagon.new

# Добавляем вагоны к поездам
tr.add_wagon (pw1)
tr.add_wagon (pw2)
tr.add_wagon (pw3)
tr.add_wagon (pw4)
tr.add_wagon (pw5)

tr3.add_wagon (pw6)
tr3.add_wagon (pw7)
tr3.add_wagon (pw8)
tr3.add_wagon (pw9)
tr3.add_wagon (pw10)

tr2.add_wagon (cw1)
tr2.add_wagon (cw2)
tr2.add_wagon (cw3)
tr2.add_wagon (cw4)
tr2.add_wagon (cw5)

# Добавляем поезда на станции
st1.recept_train (tr)
st2.recept_train (tr2)
st2.recept_train (tr3)

# Блок для вывода информации о поездах и их вагонах на станциях
train_block = lambda do |train|
  puts "Станция #{train.current_station.name}:"
  puts "#{train.number} - #{Train::TYPE[train.type]} - #{train.wagons.size}: "
  if train.type == :passenger
    train.each_wagon { |wagon, i| puts "№ #{i+1} - #{Wagon::TYPE[wagon.type]} - Свободно: #{wagon.free_places} мест - Занято: #{wagon.busy_places} мест" }
  else
    train.each_wagon { |wagon, i| puts "№ #{i+1} - #{Wagon::TYPE[wagon.type]} - Свободно: #{wagon.free_capacity} тонн - Занято: #{wagon.busy_capacity} тонн" }
  end
end

# Выводим поезда и вагоны на станциях
st1.each_train (train_block)
st2.each_train (train_block)

