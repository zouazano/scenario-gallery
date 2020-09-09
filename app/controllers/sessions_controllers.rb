class SessionsController < ApplicationController
  def create
    unless request.env['omniauth.auth'][:uid]
      flash[:danger] = '連携に失敗しました'
      redirect_to root_url
    end
    player_data = request.env['omniauth.auth']
    player = Player.find_by(uid: player_data[:uid])
    if player
      log_in player
      flash[:success] = 'ログインしました'
      redirect_to root_url
    else
      new_player = Player.new(
        uid: player_data[:uid],
        nickname: player_data[:info][:nickname],
        name: player_data[:info][:name],
        image: player_data[:info][:image],
      )
      if new_player.save
        log_in new_player
        flash[:success] = 'ユーザー登録成功'
      else
        flash[:danger] = '予期せぬエラーが発生しました'
      end
      redirect_to root_url
    end
  end


  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end
end