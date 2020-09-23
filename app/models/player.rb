class Player < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :follow_relationships
  has_many :followings, through: :follow_relationships, source: :follow
  has_many :reverse_of_follow_relationships, class_name: 'FollowRelationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_follow_relationships, source: :player

  has_many :review_relationships
  has_many :fellow_reviews, through: :review_relationships, source: :review

  def follow(other_player)
    unless self == other_player
      self.follow_relationships.find_or_create_by(follow_id: other_player.id)
    end
  end

  def unfollow(other_player)
    follow_relationship = self.follow_relationships.find_by(follow_id: other_player.id)
    follow_relationship.destroy if follow_relationship
  end

  def following?(other_player)
    self.followings.include?(other_player)
  end

end
