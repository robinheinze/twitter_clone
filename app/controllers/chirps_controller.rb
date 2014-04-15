class ChirpsController < ApplicationController

  def new
    @chirp = Chirp.new
    @user = current_user
  end

  def create
    @chirp = Chirp.create!(chirp_params)
    respond_to do |format|
      format.html { redirect_to user_path(@chirp.user) }
      format.js
    end
  end

private
  def chirp_params
    params.require(:chirp).permit(:content, :user_id, :title)
  end

end
