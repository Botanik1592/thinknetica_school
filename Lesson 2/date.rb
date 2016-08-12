# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет
# с начала года. Учесть, что год может быть високосным

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

num = 0

print "Введите число (цифры): "
day = gets.to_i
print "Введите номер месяца (цифры): "
month = gets.to_i
print "Введите год (четыре цифры): "
year = gets.to_i

if (year % 4 == 0 && !(year % 100 == 0)) || year % 400 == 0 || year == 2000
  months[1] = 29
  (month-1).times do |i|
    num = num + months[i]
  end
  num = num + day
else
  (month-1).times do |i|
    num = num + months[i]
  end
  num = num + day
end

puts "Номер этого дня с начала года: #{num}"
