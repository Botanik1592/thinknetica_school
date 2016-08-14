# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1)

hh = {}
arr = ["a", "e", "i", "o", "u"]

("a".."z").each_with_index do |let, i|
  hh[let] = i+1 if arr.include?(let)
end

puts hh
