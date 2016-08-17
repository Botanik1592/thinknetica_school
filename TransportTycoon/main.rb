require "./wagon.rb"
require "./passenger_wagon.rb"
require "./cargo_wagon.rb"
require "./train.rb"
require "./passenger_train.rb"
require "./cargo_train.rb"
require "./station.rb"
require "./route.rb"
require "./app_classes.rb"

@message = ""
@stations = []
@trains = []

system ('clear')
puts "Запуск программы управления транспортными потоками 'Диспетчер 0.1'..."
sleep(1)
menu
