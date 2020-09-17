class PlayersController < ApplicationController

  def show
    @player = Player.find(params[:id])
  end

  def bookmarks
    @player = Player.find(params[:player_id])
  end

end