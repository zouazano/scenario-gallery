class FollowRelationshipsController < ApplicationController
  before_action :set_user
  include SessionsHelper

  def create
    following = current_player.follow(@player)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to @player
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to @player
    end
  end

  def destroy
    following = current_player.unfollow(@player)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to @player
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to @player
    end
  end

  private

  def set_user
    @player = Player.find(params[:follow_id])
  end

end
