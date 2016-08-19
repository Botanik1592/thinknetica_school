require "./manufacturer.rb"
require "./instance_counter.rb"
require "./train.rb"
require "./passenger_train.rb"
require "./cargo_train.rb"
require "./wagon.rb"
require "./passenger_wagon.rb"
require "./cargo_wagon.rb"
require "./station.rb"

train1 = PassengerTrain.new ('111-2A')
#train2 = PassengerTrain.new ('111-2A')
#train2 = CargoTrain.new
puts PassengerTrain.find ('111-2A')
#puts Train.register_instance
puts PassengerTrain.instances
puts train1.valid?
