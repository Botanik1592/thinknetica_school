class Wagon
  include Manufacturer
  include InstanceCounter

  attr_reader :capacity, :busy_capacity

  def initialize
    register_instance
  end

  def free_capacity
    @capacity - @busy_capacity
  end

  def load(num=0)
    if self.type == :passenger
      @busy_capacity += 1 if @busy_capacity < @capacity
    else
      @busy_capacity += num if @busy_capacity + num <= @capacity
    end
  end

  protected

  TYPE = { passenger: "пассажирский", cargo: "грузовой" }

end
