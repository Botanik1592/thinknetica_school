require_relative './manufacturer.rb'
require_relative './instance_counter.rb'
require_relative './wagon.rb'
require_relative './passenger_wagon.rb'
require_relative './cargo_wagon.rb'
require_relative './validation.rb'
require_relative './train.rb'
require_relative './passenger_train.rb'
require_relative './cargo_train.rb'
require_relative './station.rb'
require_relative './route.rb'
require_relative './dispetcher.rb'


train1 = PassengerTrain.new("121-11")
train2 = CargoTrain.new("111-23")

station1 = Station.new("Piter")
station2 = Station.new("Moscow")
route1 = Route.new(station1, station2, "Piter-Moscow")
#pw1 = PassengerWagon.new(34)
#cw1 = CargoWagon.new(48)

station1.recept_train(train1)
station2.recept_train(train2)

puts "Passenger Train #{train1.valid?}"
puts "Cargo Train #{train2.valid?}"

puts "Station1 #{station1.valid?}"
puts "Station1 #{station2.valid?}"

puts "Route1 #{route1.valid?}"
