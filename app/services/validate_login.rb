class ValidateLogin
  def initialize(session)
    @session = session
  end

  def call
    return false unless @session.valid?

    # Call an API here
    return @session if validate_login_api

    false
  end

  private

  def validate_login_api
    # Mocked out here for now
    true
  end
end