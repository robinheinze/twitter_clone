class ChirpsController < ApplicationController

  def new
    @chirp = Chirp.new
    @user = current_user
  end

  def create
    @chirp = Chirp.new(chirp_params)
    @user = current_user
    if @chirp.save
      @chirp.find_handles.each do |recipient|

      end
      respond_to do |format|
        format.html { redirect_to user_path(@chirp.user) }
        format.js
      end
    else
      render ('users/show.html.erb')
    end
  end

private
  def chirp_params
    params.require(:chirp).permit(:content, :user_id, :title)
  end

end
