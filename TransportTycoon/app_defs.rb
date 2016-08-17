# Меню
class Dispetcher

  def initialize
    @message = ""
    @stations = []
    @trains = []
  end

  def menu
    loop do
    system ('clear')
    sleep (0.1)
    puts
    puts "Поездов: #{@trains.size}    Станций: #{@stations.size}"
    puts
    puts "--====[ Меню ]====--"
    puts "[1] - для создания станций"
    puts "[2] - для создания пассажирского поезда"
    puts "[3] - для создания грузового поезда"
    puts "[4] - для добавления вагонов к поезду"
    puts "[5] - для удаления вагонов из состава поезда"
    puts "[6] - для помещения поезда на станцию"
    puts "[7] - Список станций и поездов на них"
    puts "[0] - Выход из программы"
    puts "--====--------====--"
    puts
    puts @message
    puts
    menu_input
    end
  end

private

  def menu_input
    print "Ваш выбор: "
    user_choice = gets.strip
      case user_choice
        when "1"
          create_stations
        when "2"
          create_passenger_trains
        when "3"
          create_cargo_trains
        when "4"
          adding_wagons
        when "5"
          deleting_wagons
        when "6"
          puting_train_to_station
        when "7"
          list_stations_trains
        when "0"
          exit
        else @message = "Некорректный ввод"
      end
  end

  # Создание станций
  def create_stations
    system ('clear')
    print "Для создания станции введите название станции: "
    name = gets.strip
    station = Station.new(name)
    @stations << station
    @message = "Станция #{station.name} создана!"
  end

  # Создание пассажирского поезда
  def create_passenger_trains
    system ('clear')
    train = PassengerTrain.new(@trains.size+1)
    @trains << train
    @message = "Пассажирский поезд №#{train.number} создан!"
  end

  # Создание грузового поезда
  def create_cargo_trains
    system ('clear')
    train = CargoTrain.new(@trains.size+1)
    @trains << train
    @message = "Грузовой поезд №#{train.number} создан!"
  end

  # Выбор поезда (используется в классах добавления/удаления вагонов и в классе добавления поезда на станцию)
  def train_selector
    error = ""
    @trains.each do |train|
      puts "№ #{train.number} - #{Train::TYPE[train.type]} - вагонов #{train.wagons.size}"
    end
    loop do
      #system ('clear')
      puts error
      print "Введите номер поезда: "
      user_input = gets.to_i-1
      if @trains.include?(@trains[user_input])
        return train = @trains[user_input]
      else
        error = "Поезд с таким номером не существует!"
      end
    end
  end

  # Добавления вагонов к поезду
  def adding_wagons
    system ('clear')
    puts "--====[ Добавление вагонов ]====--"
    puts
    train = train_selector
    print "Введите колличество вагонов для добавления к составу № #{train.number}: "
    user_input = gets.to_i
    if train.type == :passenger
      user_input.times do
        wagon = PassengerWagon.new
        train.add_wagon(wagon)
      end
    else
      user_input.times do
        wagon = CargoWagon.new
        train.add_wagon(wagon)
      end
    end
    @message = "К составу № #{train.number} было добавлено #{user_input} вагона(ов)."
  end

  # Удаление вагонов из поезда
  def deleting_wagons
    system ('clear')
    puts "--====[ Удаление вагонов ]====--"
    puts
    train = train_selector
    print "Введите колличество вагонов для удаления из состава №#{train.number}: "
    user_input = gets.to_i
    if train.wagons.size < user_input
      @message = "Нельзя отцепить вагонов больше, чем есть у состава!"
    else
      user_input.times do
        train.remove_wagon(train.wagons.last)
      end
      @message = "От состава №#{train.number} было отцеплено #{user_input} вагона(ов)."
    end
  end

  # Добавление поезда на станцию
  def puting_train_to_station
    system ('clear')
    puts "--====[ Добавление поезда на станцию ]====--"
    puts
    train = train_selector
    @stations.each_with_index do |station, i|
      puts "[#{i+1}] #{station.name}"
    end
    print "Введите номер станции для добавления поезда №#{train.number}: "
    user_input = gets.to_i-1
    if @stations.size < user_input
      @message = "Такой станции не существует!"
    else
      station = @stations[user_input]
      station.recept_train(train)
      @message = "Поезд № #{train.number} был добавлен на станцию #{station.name}."
    end
  end

  # Список станций с поездами
  def list_stations_trains
    system ('clear')
    @stations.each_with_index do |station, i|
      print "#{i+1}) "
      station.show_trains
      puts
    end
    print "Нажмите Enter для продолжения."
    gets
  end
end
