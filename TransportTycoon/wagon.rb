class Wagon
  include Manufacturer
  include InstanceCounter

  attr_reader :capacity, :busy_capacity

  TYPE = { passenger: 'пассажирский', cargo: 'грузовой' }.freeze

  def initialize
    register_instance
  end

  def free_capacity
    @capacity - @busy_capacity
  end

  def load(num = 0)
    if type == :passenger && @busy_capacity < @capacity
      @busy_capacity += 1
    elsif type == :cargo && @busy_capacity + num <= @capacity
      @busy_capacity += num
    end
  end

end
