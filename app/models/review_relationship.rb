class ReviewRelationship < ApplicationRecord
  belongs_to :player
  belongs_to :review
end
