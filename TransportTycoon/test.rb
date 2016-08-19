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

piter = Station.new ("Питер")
moscow = Station.new ("Москва")

route1 = Route.new(piter, moscow, "Питер-Москва")
