class Writer < ApplicationRecord
  has_many :scenario_writers
  has_many :scenarios, through: :scenario_writers
end
