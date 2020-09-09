class Scenario < ApplicationRecord
  has_many :scenario_writers
  has_many :writers, through: :scenario_writers
end
