# Прямоугольный треугольник

def right_triangle(a, b, c)
  if a > b && a > c
    b**2 + c**2 == a**2
  elsif b > a && b > c
    hyp = b
  elsif c > a && c > b
    hyp = c
  end
  return hyp
end

print "Введите длину 1-й стороны треугольника: "
a = gets.to_i

print "Введите длину 2-й стороны треугольника: "
b = gets.to_i

print "Введите длину 3-й стороны треугольника: "
c = gets.to_i

puts hypotenuse_search(a, b, c)
