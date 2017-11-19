class SessionsController < ApplicationController
  skip_before_action :authenticate

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # POST /sessions
  # POST /sessions.json
  def create
    flybuys_number = params[:session][:flybuys_number]

    @session = Session.new(
      flybuys_number: flybuys_number,
      password: params[:session][:password],
    )

    validate_login = ValidateLogin.new(@session)

    respond_to do |format|
      if validate_login.call
        session[:flybuys_number] = flybuys_number

        format.html { redirect_to root_path, notice: 'Login successful' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new, notice: 'Invaild login' }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    session[:flybuys_number] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
