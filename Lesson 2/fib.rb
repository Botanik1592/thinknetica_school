# Заполнить массив числами фибоначи до 100

arr = [0,1]

2.upto(100) do |i|
  arr[i] = arr[-1] + arr[-2]
end

puts arr

# Можно сделать через each:
# (2..100).each do |i|
#   arr[i] = arr[-1] + arr[-2]
# end
