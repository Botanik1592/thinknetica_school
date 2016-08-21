class PassengerWagon < Wagon

  attr_reader :capacity, :busy_places

  def initialize (capacity=48)
    @capacity = capacity
    @busy_places = 0
  end

  def type
    :passenger
  end

  def free_places
    @capacity - @busy_places
  end

  def take_place
    @busy_places += 1 if @busy_places < @capacity
  end

end
