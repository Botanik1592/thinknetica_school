class Dispetcher
  def initialize
    @message = ''
    @stations = []
    @trains = []
  end

  def menu
    loop do
      system 'clear'
      sleep 0.1
      puts
      puts "Поездов: #{@trains.size}    Станций: #{@stations.size}"
      puts
      puts '--====[ Меню ]====--'
      puts '[1] - для создания станций'
      puts '[2] - для создания пассажирского поезда'
      puts '[3] - для создания грузового поезда'
      puts '[4] - для добавления вагонов к поезду'
      puts '[5] - для удаления вагонов из состава поезда'
      puts '[6] - для помещения поезда на станцию'
      puts '[7] - Список станций и поездов на них'
      puts '[8] - Список доступных поездов'
      puts '[9] - Загрузка вагонов'
      puts '[0] - Выход из программы'
      puts '--====--------====--'
      puts
      puts @message
      puts
      menu_input
    end
  end

  private

  def menu_input
    print 'Ваш выбор: '
    user_choice = gets.strip
    case user_choice
    when '1'
      create_stations
    when '2'
      create_trains(2)
    when '3'
      create_trains(3)
    when '4'
      adding_wagons
    when '5'
      deleting_wagons
    when '6'
      puting_train_to_station
    when '7'
      list_stations_trains
    when '8'
      aviable_trains
    when '9'
      wagon_load
    when '0'
      exit
    else @message = 'Некорректный ввод'
    end
  end

  def create_stations
    attempt ||= 0
    system 'clear' if attempt.zero?
    cr_stations
  rescue StandardError => e
    attempt += 1
    system 'clear'
    puts e
    retry until e.nil?
  end

  def cr_stations
    print 'Для создания станции введите название станции: '
    name = gets.strip
    station = Station.new(name)
    @stations << station
    @message = "Станция #{station.name} создана!"
  end

  def create_trains(input)
    attempt ||= 0
    system 'clear' if attempt.zero?
    input == 3 ? cc_train : cp_train
  rescue StandardError => e
    attempt += 1
    system 'clear'
    puts e
    retry until e.nil?
  end

  def cp_train
    print 'Введите номер пассажирского поезда в формате XXX-XX или XXXXX: '
    num = gets.strip.to_sym
    train = PassengerTrain.new(num)
    @trains << train
    @message = "Пассажирский поезд № #{train.number} создан!"
  end

  def cc_train
    print 'Введите номер грузового поезда в формате XXX-XX или XXXXX: '
    num = gets.strip.to_sym
    train = CargoTrain.new(num)
    @trains << train
    @message = "Грузовой поезд № #{train.number} создан!"
  end

  def train_selector
    error = ''
    @trains.each_with_index do |train, i|
      puts "[#{i + 1}] - № #{train.number} - #{Train::TYPE[train.type]} - вагонов #{train.wagons.size}"
    end
    loop do
      # system ('clear')
      puts error
      print 'Введите номер поезда: '
      user_input = gets.to_i - 1
      if @trains.include?(@trains[user_input])
        return train = @trains[user_input]
      else
        error = 'Поезд с таким номером не существует!'
      end
    end
  end

  def adding_wagons
    system 'clear'
    puts '--====[ Добавление вагонов ]====--'
    puts
    train = train_selector
    print "Введите колличество вагонов для добавления к составу № #{train.number}: "
    user_input = gets.to_i
    if train.type == :passenger
      print 'Введите колличество пассажирских мест в вагоне: '
      pas_capacity = gets.to_i
      user_input.times do
        wagon = PassengerWagon.new pas_capacity
        train.add_wagon(wagon)
      end
    else
      print 'Введите доступный объем груза в вагоне в тоннах: '
      load_capacity = gets.to_i
      user_input.times do
        wagon = CargoWagon.new load_capacity
        train.add_wagon(wagon)
      end
    end
    @message = "К составу № #{train.number} было добавлено #{user_input} вагона(ов)."
  end

  def deleting_wagons
    system 'clear'
    puts '--====[ Удаление вагонов ]====--'
    puts
    train = train_selector
    print "Введите колличество вагонов для удаления из состава №#{train.number}: "
    user_input = gets.to_i
    if train.wagons.size < user_input
      @message = 'Нельзя отцепить вагонов больше, чем есть у состава!'
    else
      user_input.times do
        train.remove_wagon(train.wagons.last)
      end
      @message = "От состава №#{train.number} было отцеплено #{user_input} вагона(ов)."
    end
  end

  def puting_train_to_station
    system 'clear'
    puts '--====[ Добавление поезда на станцию ]====--'
    puts
    train = train_selector
    @stations.each_with_index do |station, i|
      puts "[#{i + 1}] #{station.name}"
    end
    print "Введите номер станции для добавления поезда №#{train.number}: "
    user_input = gets.to_i - 1
    if @stations.size < user_input
      @message = 'Такой станции не существует!'
    else
      station = @stations[user_input]
      station.recept_train(train)
      @message = "Поезд № #{train.number} был добавлен на станцию #{station.name}."
    end
  end

  def train_show_wagons(train)
    puts "#{train.number} - #{Train::TYPE[train.type]} - #{train.wagons.size}: "
    train.each_wagon { |wagon, i| puts "№ #{i + 1} - #{Wagon::TYPE[wagon.type]} - Свободно: #{wagon.free_capacity} - Занято: #{wagon.busy_capacity}" }
  end

  def list_stations_trains
    train_block = lambda do |train|
      train_show_wagons train
    end

    system 'clear'
    @stations.each do |station|
      puts station.name
      station.each_train train_block
      puts
    end
    print 'Нажмите Enter для продолжения.'
    gets
  end

  def aviable_trains
    system 'clear'
    @trains.each do |train|
      train_show_wagons train
    end
    print 'Нажмите Enter для продолжения.'
    gets
  end

  def wagon_load
    system 'clear'
    train = train_selector
    train_show_wagons train
    print 'Введите номер вагона: '
    num = gets.to_i
    wagon = train.wagons[num - 1]
    if wagon.type == :passenger && wagon.free_capacity > 0
      wagon.load
      @message = "Пассажир добавлен. Поезд № #{train.number} : Вагон № #{num} : Свободно: #{wagon.free_capacity} мест : Занято: #{wagon.busy_capacity} мест"
    elsif wagon.type == :passenger && wagon.free_capacity.zero?
      @message = 'Ошибка! В вагоне нет свободных мест'
    else
      print 'Сколько тонн товаров загрузить: '
      product_count = gets.to_f
      if product_count > wagon.free_capacity
        @message = "Ошибка! Для загрузки доступно: #{wagon.free_capacity}"
      else
        wagon.load(product_count)
        @message = "Загрузка завершена. Поезд № #{train.number} : Вагон № #{num} : Свободно: #{wagon.free_capacity} тонн : Занято: #{wagon.busy_capacity} тонн"
      end
    end
  end
end
