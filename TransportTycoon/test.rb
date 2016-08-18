require "./manufacturer.rb"
require "./instance_counter.rb"
require "./train.rb"
require "./passenger_train.rb"
require "./wagon.rb"
require "./passenger_wagon.rb"
require "./station.rb"


train1 = PassengerTrain.new (111)

st1 = Station.new ("Станция1")
st2 = Station.new ("Станция2")
st2 = Station.new ("Станция3")

Station.all

puts Train.find(11)
puts Train.instances

