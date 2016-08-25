require './accessor.rb'

class Test
  include Accessors

  attr_accessor_with_history :a, :b
  strong_attr_accessor :aaa, :Fixnum
  strong_attr_accessor :bbb, :String

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

test1.aaa = 123
test1.bbb = "Petr"

