class Player < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
end
