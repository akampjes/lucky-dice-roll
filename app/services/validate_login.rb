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
    # TODO: Document a validate_login API
    true
  end
end