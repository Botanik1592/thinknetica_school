class Train
  include Manufacturer
  include InstanceCounter

  @@trains_list = {}

  attr_reader :number, :type, :route, :current_speed, :current_station, :wagons

  TYPE = { passenger: 'пасажирский', cargo: 'грузовой' }.freeze

  NUMBER = /^[a-z0-9]{3}[-]?[a-z0-9]{2}$/i

  def initialize(number)
    @number = number
    @current_speed = 0
    @current_station = ''
    @route = []
    @wagons = []
    @manufacturer = ''
    validate!
    number_validate!
    @@trains_list[number] = self
    register_instance
  end

  def self.find(number)
    @@trains_list.key?(number) ? @@trains_list[number] : nil
  end

  def valid?
    validate!
  rescue
    false
  end

  def each_wagon
    @wagons.each_with_index do |wagon, i|
      yield(wagon, i)
    end
  end

  def add_current_station(station)
    add_current_station!(station)
  end

  def stop
    stop! if train_running?
  end

  def go
    go! if train_stopped?
  end

  def train_stopped?
    current_speed.zero?
  end

  def train_running?
    current_speed.nonzero?
  end

  def add_wagon(wagon)
    if current_speed.zero? && wagon.type == type
      @wagons << wagon
    elsif current_speed.zero? && wagon.type != type
      puts 'Прицеплять можно только вагоны своего типа.'
    else
      puts 'Прицеплять вагоны можно при полной остановке поезда.'
    end
  end

  def remove_wagon(wagon)
    if current_speed.zero? && !@wagons.empty?
      @wagons.delete(wagon)
    elsif current_speed.zero? && @wagons.size.zero?
      puts 'Вагонов должно быть больше нуля!'
    else
      puts 'Прицеплять вагоны можно при полной остановке поезда.'
    end
  end

  def show_wagons
    @wagons.each_with_index do |wagon, i|
      puts "#{i + 1}) #{wagon}"
    end
  end

  def recieve_route(route)
    @route = route.route
  end

  def local_station
    puts "Поезд №#{number} на станции #{@current_station.name}"
  end

  def next_station
    next_station = @route.index(@current_station).to_i + 1
    if next_station > @route.size.to_i - 1
      puts 'Мы на конечной.'
    else
      puts "Следущая станция #{@route[next_station].name}"
    end
  end

  def prev_station
    prev_station = @route.index(@current_station).to_i - 1
    if prev_station < 0
      puts 'Мы на конечной.'
    else
      puts "Предыдущая станция #{@route[prev_station].name}"
    end
  end

  def go_to(station)
    if @route.include?(station) && station != @current_station && @route.index(@current_station).to_i > @route.index(station).to_i
      @current_station.send_train(self)
      (@route.index(@current_station).to_i - 1).downto(@route.index(station).to_i + 1) do |i|
        @route[i].recept_train(self)
        @route[i].send_train(self)
      end
      station.recept_train(self)
    elsif @route.include?(station) && station != @current_station && @route.index(@current_station).to_i < @route.index(station).to_i
      @current_station.send_train(self)
      (@route.index(@current_station).to_i + 1).upto(@route.index(station).to_i - 1) do |i|
        @route[i].recept_train(self)
        @route[i].send_train(self)
      end
      station.recept_train(self)
    elsif station == @current_station
      puts 'Поезд уже на этой станции!'
    else
      puts 'Неизвестное местоназначение.'
    end
  end

  protected

  def validate!
    raise 'Номер не может быть пустым!' if number.nil?
    raise 'Номер имеет неверный формат! Используйте XXX-XX или XXXXX.' if number !~ NUMBER
    raise "Такой номер (#{number}) уже присутствует!" if @@trains_list.key?(number)
    true
  end

  def number_validate!
    raise "Такой номер (#{number}) уже присутствует!" if @@trains_list.key?(number)
    true
  end

  attr_writer :current_speed, :current_station

  def go!
    self.current_speed = train_speed
  end

  def stop!
    self.current_speed = 0
  end

  def train_speed
    80
  end

  def add_current_station!(station)
    self.current_station = station
  end
end
