require './accessor.rb'

class Test
  include Accessors

  attr_accessor_with_history :a, :b
  strong_attr_accessor :aaa, String
  strong_attr_accessor :bbb, Fixnum

end

test1 = Test.new

test1.a = 111
puts test1.a
test1.a = 222
puts test1.a
puts test1.a_history.inspect

test1.b = "Maria"
test1.b = "Alexandra"
test1.b = "Vika"
puts test1.b
puts test1.b_history.inspect
puts
puts
test1.a = 333
test1.a = 444
puts test1.a
puts test1.a_history.inspect

test1.b = "Anton"
test1.b = "Serj"
test1.b = "Petr"
puts test1.b
puts test1.b_history.inspect

test1.aaa = "Mark"
test1.bbb = 123
