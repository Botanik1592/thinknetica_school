require './route.rb'
require './train.rb'
require './station.rb'

# Объявляем два поезда
redarrow = Train.new(111, :passenger, 17)
cargo1 = Train.new(222, :cargo, 54)
cargo2 = Train.new(333, :cargo, 2)

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

route2.add_station(s4)
route2.add_station(s3)

# Задаем маршруты поездам
redarrow.recieve_route(route1)
cargo1.recieve_route(route2)

#Загоняем поезда на станции
s1.recept_train(redarrow)
s2.recept_train(cargo1)
puts
# Отправляем поезда до станций
redarrow.go_to(s2)
puts
cargo1.go_to(s1)
