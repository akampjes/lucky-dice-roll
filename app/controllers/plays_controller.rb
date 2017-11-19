class PlaysController < ApplicationController
  # GET /plays/1
  # GET /plays/1.json
  def show
    redirect_to new_play_path unless current_play
  end

  # GET /plays/new
  def new
    flybuys_number = session[:flybuys_number]
    current_points = GetPoints.new(flybuys_number).call

    @play = Play.new(points: current_points)
  end

  # POST /plays
  # POST /plays.json
  def create
    @play = CreateNewPlay.new(
      flybuys_number: session[:flybuys_number],
      current_play: current_play,
      bet: params[:play][:bet]
    ).call

    respond_to do |format|
      if @play
        format.html { redirect_to play_path, notice: 'Play was successfully created.' }
        format.json { render :show, status: :created, location: @play }
      else
        format.html { render :new }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end
end
