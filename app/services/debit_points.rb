class DebitPoints
  attr_accessor :flybuys_number, :points

  def initialize(flybuys_number:, points:)
    @flybuys_number = flybuys_number
    @points = points
  end

  def call
    true
  end
end

