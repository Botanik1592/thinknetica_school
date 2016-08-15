require './route.rb'
require './train.rb'
require './station.rb'

# Объявляем два поезда
redarrow = Train.new(111, "пассажирский", 17)
cargo1 = Train.new(222, "грузовой", 54)

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
route1.add_station(s4)

route2.add_station(s4)
route2.add_station(s3)

# Задаем маршруты поездам
redarrow.recieve_route(route1)
cargo1.recieve_route(route2)

#Загоняем поезда на станции
s1.recept_train(redarrow)
s2.recept_train(cargo1)

# Отправляем Красную Стрелу в Москву, а потом обратно.
redarrow.go_to(s2)
redarrow.go_to(s1)

# Отправляем товарняк в Питер, а потом обратно
cargo1.go_to(s1)
cargo1.go_to(s2)
