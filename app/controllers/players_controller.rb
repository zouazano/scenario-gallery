class PlayersController < ApplicationController

  def show
    @player = Player.find(params[:id])
  end

  def index
    @q = Player.ransack(params[:q])
    @players = @q.result(distinct: true).order(created_at: "DESC").page(params[:page]).per(30)
  end

  def bookmarks
    @player = Player.find(params[:player_id])
  end

end