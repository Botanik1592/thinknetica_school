class Train

  attr_accessor :speed, :current_station

  attr_reader :number, :type, :wagons_count, :route

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons_count = wagons
    @speed = 0
    @route = []
  end

  def stop
    @speed = 0
  end

  def wagons
    puts @wagons_count
  end

  def add_wagon
    speed == 0 ? @wagons_count += 1 : puts("Прицеплять вагоны можно при полной остановке поезда.")
  end

  def remove_wagon
    speed == 0 ? @wagons_count -= 1 : puts("Отцеплять вагоны можно при полной остановке поезда.")
  end

  def recieve_route(route)
    @route = route.route
  end

  def go_to(station)
    if @route.include?(station) && station != @current_station

      if @route.index(@current_station).to_i > @route.index(station).to_i
        @current_station.send_train(self)
        (@route.index(@current_station).to_i-1).downto(@route.index(station).to_i+1) do |i|
          @route[i].recept_train(self)
          @route[i].send_train(self)
        end
        station.recept_train(self)
      else
        @current_station.send_train(self)
        (@route.index(@current_station).to_i+1).upto(@route.index(station).to_i-1) do |i|
          @route[i].recept_train(self)
          @route[i].send_train(self)
        end
        station.recept_train(self)
      end

    elsif station == @current_station
      puts "Поезд уже на этой станции!"
    else
      puts "Неизвестное местоназначение."
    end
  end

  def local_station
    puts "Поезд на станции #{@current_station.name}"
  end

  def next_station
    next_station = @route.index(@current_station).to_i+1
    puts "Следущая станция #{@route[next_station].name}"
  end

  def prev_station
    prev_station = @route.index(@current_station).to_i-1
    if prev_station < 0
      puts "Мы на конечной."
    else
      puts "Предыдущая станция #{@route[prev_station].name}"
    end
  end
end

