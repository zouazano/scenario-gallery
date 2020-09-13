class Scenario < ApplicationRecord
  has_many :scenario_writers
  has_many :writers, through: :scenario_writers

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_players, through: :bookmarks, source: :player

  # お気に入りに追加する
  def add(player)
    bookmarks.create(player_id: player.id)
  end

  # お気に入りから削除する
  def remove(player)
    bookmarks.find_by(player_id: player.id).destroy
  end

  # current_palyerがお気に入りしてたらtrueを返す
  def add?(player)
    bookmark_players.include?(player)
  end

end
