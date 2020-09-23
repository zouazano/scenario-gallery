class Review < ApplicationRecord
  belongs_to :player
  belongs_to :scenario

  has_many :review_relationships
  has_many :fellow_players, through: :review_relationships, source: :player

  validates :player_id, presence: true
  validates :scenario_id, presence: true

end
