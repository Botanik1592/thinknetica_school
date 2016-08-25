require './validation.rb'
require './manufacturer.rb'
require './instance_counter.rb'
require './wagon.rb'
require './passenger_wagon.rb'
require './cargo_wagon.rb'
require './train.rb'
require './passenger_train.rb'
require './cargo_train.rb'
require './station.rb'
require './route.rb'
require './dispetcher.rb'

dispetcher = Dispetcher.new

system 'clear'
puts "Запуск программы управления транспортными потоками 'Диспетчер 0.1'..."
sleep(1)
dispetcher.menu
