require './route.rb'
require './train.rb'
require './station.rb'

# Объявляем два поезда
redarrow = Train.new(111, :passenger, 17)
cargo1 = Train.new(222, :cargo, 54)

# Объявляем станции
s1 = Station.new("Питер")
s2 = Station.new("Москва")
s3 = Station.new("Любань")
s4 = Station.new("Бологое")
s5 = Station.new("Пушкин")

# Объявялем маршруты
route1 = Route.new(s1, s2)
route2 = Route.new(s2, s1)

# Добавляем станции в маршруты
route1.add_station(s3)
route1.add_station(s4)

route2.add_station(s3)
route2.add_station(s4)

# Задаем маршруты поездам
redarrow.recieve_route(route1)
cargo1.recieve_route(route2)

#Загоняем поезда на станции
s1.recept_train(redarrow)
s2.recept_train(cargo1)

# Отправляем Красную Стрелу в Бологое.
redarrow.go_to(s4)

# Отправляем товарняк в Любань
cargo1.go_to(s3)

# Выдаем список поездов на станции
s3.show_passenger_trains
s3.show_freight_trains
s4.show_passenger_trains
s4.show_freight_trains

# Список всех поездов на станции
s1.show_trains
s2.show_trains

# Вывод текщей станции
redarrow.local_station
cargo1.local_station

# Вывод следующей станции
redarrow.next_station
redarrow.prev_station

# Вывод предыдущей станции
cargo1.next_station
cargo1.prev_station
