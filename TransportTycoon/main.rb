require "./wagon.rb"
require "./passenger_wagon.rb"
require "./cargo_wagon.rb"
require "./train.rb"
require "./passenger_train.rb"
require "./cargo_train.rb"
require "./station.rb"
require "./route.rb"

@message = ""
@stations = []
@trains = []

def menu
  loop do
    system ('clear')
    sleep (0.1)
    puts
    puts "Поездов: #{@trains.size}    Станций: #{@stations.size}"
    puts
    puts "--====[ Меню ]====--"
    puts "(1) - для создания станций"
    puts "(2) - для создания пассажирского поезда"
    puts "(3) - для создания грузового поезда"
    puts "(4) - для добавления вагонов к поезду"
    puts "(5) - для удаления вагонов из состава поезда"
    puts "(6) - для помещения поезда на станцию"
    puts "(7) - Список станций и поездов на них"
    puts "(0) - Выход из программы"
    puts "--====--------====--"
    puts
    puts @message
    puts
    print "Ваш выбор: "
    user_choice = gets.strip

    case user_choice
      when "1" then create_stations
      when "2" then create_passenger_trains
      when "3" then create_cargo_trains
      when "4" then adding_wagons
      when "5" then deleting_wagons
      when "6" then puting_train_to_station
      when "7" then list_stations_trains
      when "0" then exit
      else @message = "Некорректный ввод"
    end
  end
end

def create_stations
  system ('clear')
  print "Для создания станции введите название станции: "
  name = gets.strip
  station = Station.new(name)
  @stations << station
  @message = "Станция #{station.name} создана!"
end

def create_passenger_trains
  system ('clear')
  train = PassengerTrain.new(@trains.size+1, :passenger)
  @trains << train
  @message = "Пассажирский поезд №#{train.number} создан!"
end

def create_cargo_trains
  system ('clear')
  train = CargoTrain.new(@trains.size+1, :cargo)
  @trains << train
  @message = "Грузовой поезд №#{train.number} создан!"
end

def adding_wagons
  system ('clear')
  @trains.each_with_index do |train, i|
    puts "#{i+1}) #{train.number}"
  end
  puts "Введите номер поезда и через пробел колличество вагонов для добавления: "
  user_input = gets.chomp
  arr = user_input.split(/ /)
  train = @trains[(arr[0].to_i-1)]
  if train.type == :passenger
    arr[1].to_i.times do
      wagon = PassengerWagon.new
      train.add_wagon(wagon)
    end
  else
    arr[1].to_i.times do
      wagon = CargoWagon.new
      train.add_wagon(wagon)
    end
  end
  train.show_wagons
  gets
end

def list_stations_trains
  system ('clear')
  @stations.each_with_index do |station, i|
    puts "#{i+1}) #{station.name}"
  end
  gets
end

system ('clear')
puts "Запуск программы управления транспортными потоками 'Диспетчер 0.1'..."
menu
