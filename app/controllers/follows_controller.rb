class FollowsController < ApplicationController
  def create
    @follow = Follow.new(follow_params)
    if @follow.save
      flash[:notice] = "You are now following #{User.find(@follow.followed_id).name}"
      redirect_to :back
    else
      flash[:notice] = "NO"
      redirect_to :back
    end
  end

private
  def follow_params
    params.require(:follow).permit(:follower_id, :followed_id)
  end
end
