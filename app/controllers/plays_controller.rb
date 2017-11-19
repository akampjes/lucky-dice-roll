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
    flybuys_number = session[:flybuys_number]
    current_points = GetPoints.new(flybuys_number).call

    # TODO: Check here to check when they last played

    @play = Play.new(play_params)
    @play.flybuys_number = flybuys_number
    @play.points = current_points

    respond_to do |format|
      if @play.save
        format.html { redirect_to play_path, notice: 'Play was successfully created.' }
        format.json { render :show, status: :created, location: @play }
      else
        format.html { render :new }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def play_params
      params.require(:play).permit(:bet)
    end
end
