class RollsController < ApplicationController
  # GET /rolls/new
  def new
    @roll = Roll.new
  end

  # POST /rolls
  # POST /rolls.json
  def create
    roll = Roll.new(play: current_play)
    roll_result = RollDice.new(play: current_play, roll: roll).call

    respond_to do |format|
      if roll_result
        format.html { redirect_to play_path, notice: 'Roll was successfully created.' }
        format.json { render :show, status: :created, location: @roll }
      else
        format.html { render :new }
        format.json { render json: @roll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rolls/1
  # DELETE /rolls/1.json
  def destroy
    @roll.destroy
    respond_to do |format|
      format.html { redirect_to rolls_url, notice: 'Roll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
