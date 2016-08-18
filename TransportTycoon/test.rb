require "./manufacturer.rb"
require "./instance_counter.rb"
require "./train.rb"
require "./passenger_train.rb"
require "./cargo_train.rb"
require "./wagon.rb"
require "./passenger_wagon.rb"
require "./cargo_wagon.rb"
require "./station.rb"


# Тест поездов и задания имени производителя
train1 = PassengerTrain.new (111)

train2 = PassengerTrain.new (112)

train3 = PassengerTrain.new (113)


train4 = CargoTrain.new (211)

train5 = CargoTrain.new (212)

train6 = CargoTrain.new (213)


# Тест вагонов и задания имени производителя
wagon1 = PassengerWagon.new
wagon2 = PassengerWagon.new
wagon3 = PassengerWagon.new
wagon4 = CargoWagon.new
wagon5 = CargoWagon.new
wagon6 = CargoWagon.new


# Тест списка объектов класса
st1 = Station.new ("Питер")
st2 = Station.new ("Бологое")
st2 = Station.new ("Москва")
Station.all

# Возврата имени поиска объекта класса и возврата производителя
puts Train.find(111)
puts train1.manufacturer
puts Train.find(112)
puts train2.manufacturer
puts Train.find(113)
puts train3.manufacturer
puts Train.find(211)
puts train4.manufacturer
puts Train.find(212)
puts train5.manufacturer
puts Train.find(213)
puts train6.manufacturer

puts wagon1.manufacturer
puts wagon2.manufacturer
puts wagon3.manufacturer
puts wagon4.manufacturer
puts wagon5.manufacturer
puts wagon6.manufacturer

# Тест возврата колличества объектов класса
puts Train.instances
puts Wagon.instances
