# Заполнить массив числами от 10 до 100 с шагом 5

arr = Array.new
i = 10

loop do
  arr << i
  i += 5
  break if i > 100
end
