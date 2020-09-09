module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(player)
    session[:uid] = player.uid
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_player
    if session[:uid]
      @current_player ||= Player.find_by(uid: session[:uid])
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_player.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:uid)
    @current_player = nil
  end
end