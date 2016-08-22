class CargoWagon < Wagon

  def initialize (capacity = 56.0)
    @capacity = capacity
    @busy_capacity = 0.0
  end

  def type
    :cargo
  end

end
