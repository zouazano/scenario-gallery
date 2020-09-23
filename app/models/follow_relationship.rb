class FollowRelationship < ApplicationRecord
  belongs_to :player
  belongs_to :follow, class_name: 'Player'

  validates :player_id, presence: true
  validates :follow_id, presence: true
end
