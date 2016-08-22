class PassengerWagon < Wagon
  def initialize(capacity = 48)
    @capacity = capacity
    @busy_capacity = 0
  end

  def type
    :passenger
  end
end
