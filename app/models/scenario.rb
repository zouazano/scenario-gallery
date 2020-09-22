class Scenario < ApplicationRecord
  has_many :scenario_writers
  has_many :writers, through: :scenario_writers

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_players, through: :bookmarks, source: :player

  has_many :reviews, dependent: :destroy
  has_many :review_players, through: :reviews, source: :player

  # お気に入りに追加する
  def add_bookmark(player)
    bookmarks.create(player_id: player.id)
  end

  # お気に入りから削除する
  def remove_bookmark(player)
    bookmarks.find_by(player_id: player.id).destroy
  end

  # playerがお気に入りしてたらtrueを返す
  def bookmark_added?(player)
    bookmark_players.include?(player)
  end

  # レビューを追加する
  def add_review(review_params)
    reviews.create(review_params)
  end

  # レビューを削除する
  def remove_review(player)
    reviews.find_by(player_id: player.id).destroy
  end

  # playerがレビューを追加していたらtrueを返す
  def review_added?(player)
    review_players.include?(player)
  end

  # レビューの平均スコアを返す
  def average_score
    reviews&.average(:score)&.round(1)
  end

  private

    def review_params
      params.require(:review).permit(:player_id, :scenario_id, :score, :content, :spoiler)
    end

end
