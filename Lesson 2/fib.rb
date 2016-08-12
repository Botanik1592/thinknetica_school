# Заполнить массив числами фибоначи до 100

arr = [0,1,1]

fib = arr[0]
fib1 = arr[1]
fib2 = arr[2]

97.times do
  arr << fib = fib1 + fib2
  fib1, fib2 = fib2, fib
end
