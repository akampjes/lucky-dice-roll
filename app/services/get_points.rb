class GetPoints
  def initialize(flybuys_number)
    @flybuys_number = flybuys_number
  end

  def call
    get_points_api
  end

  private

  def get_points_api
    10000
  end
end
