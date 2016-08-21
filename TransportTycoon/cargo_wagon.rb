class CargoWagon < Wagon

  attr_reader :load_capacity, :busy_capacity

  def initialize (load_capacity = 56.0)
    @load_capacity = load_capacity
    @busy_capacity = 0.0
  end

  def type
    :cargo
  end

  def free_capacity
    @load_capacity - @busy_capacity
  end

  def load(num)
    @busy_capacity += num if @busy_capacity + num <= @load_capacity
  end

end
