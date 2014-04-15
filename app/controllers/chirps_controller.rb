class ChirpsController < ApplicationController

  def new
    @chirp = Chirp.new
    @user = current_user
  end

  def create
    @chirp = Chirp.new(chirp_params)
    @user = current_user
    if @chirp.save
      @chirp.find_handles.each { |user| @chirp.send_emails_to_tagged_users(user)}
      respond_to do |format|
        format.html { redirect_to user_path(@chirp.user) }
        format.js
      end
    else
      flash[:alert] = "Caution! Your chirp has not saved!"
      render ('users/show.html.erb')
    end
  end

private
  def chirp_params
    params.require(:chirp).permit(:content, :user_id, :title)
  end

end
