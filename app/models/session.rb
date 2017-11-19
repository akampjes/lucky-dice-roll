class Session
  include ActiveModel::AttributeMethods
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActiveModel::Model
  extend  ActiveModel::Naming

  attr_accessor :flybuys_number, :password

  validates :flybuys_number, presence: true, format: { with: /\A6014\d{12}/}
  validates :password, presence: true

  def persisted?
    false
  end
end
