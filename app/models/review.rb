class Review < ApplicationRecord
  belongs_to :player
  belongs_to :scenario
  validates :player_id, presence: true
  validates :scenario_id, presence: true
end
