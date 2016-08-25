class PassengerTrain < Train

  def initialize(number)
    super
    @type = :passenger
  end

  protected

  def train_speed
    120
  end
end
