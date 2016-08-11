# Программа расчетна идеального веса
print "Введите ваше имя: "
user_name = gets.strip.capitalize

# Обзываем пользователя Анонимусом, если он не ввел имя
user_name = 'Anonimous' if user_name == ''

print "Введите ваш рост: "
user_height = gets.to_i

# Проверяем корректность ввода роста
puts "Некорректный ввод" if user_height <= 0 || user_height == ''

# Считаем идеальный вес
ideal_weight = user_height - 110

# Выводим результат
if ideal_weight < 0
  puts "#{user_name}, ваш вес уже оптимальный."
else
  puts "#{user_name}, ваш идеальный вес: #{ideal_weight}."
end
