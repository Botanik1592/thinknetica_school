# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет
# с начала года. Учесть, что год может быть високосным

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

def days_count (month, day, months)
  num = 0
  (month-1).times do |i|
    num += months[i]
  end
  num += day
end

print "Введите число (цифры): "
day = gets.to_i
print "Введите номер месяца (цифры): "
month = gets.to_i
print "Введите год (четыре цифры): "
year = gets.to_i


if (year % 4 == 0 && !(year % 100 == 0)) || year % 400 == 0 || year == 2000
  months[1] = 29
  puts "Номер этого дня с начала года: #{days_count(month, day, months)}"
else
  puts "Номер этого дня с начала года: #{days_count(month, day, months)}"
end

