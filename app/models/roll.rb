class Roll < ApplicationRecord
  belongs_to :play

  validates :result, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 6}

  def successful?
    # 2 means to double the points
    result == 2
  end

  def unsuccessful?
    !successful?
  end
end
