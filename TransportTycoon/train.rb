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

  def wagons_count
    puts @wagons_count
  end

  def add_wagon
    speed == 0 ? @wagons_count += 1 : (puts "Прицеплять вагоны можно при полной остановке поезда.")
  end

  def remove_wagon
    speed == 0 ? @wagons_count -= 1 : (puts "Отцеплять вагоны можно при полной остановке поезда.")
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
end

