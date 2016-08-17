class CargoTrain < Train

  def initialize(number)
    super
    @type = :cargo
  end

  protected

  def train_speed
    70
  end
end
