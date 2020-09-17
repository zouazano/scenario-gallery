class AddColumnsToScenarios < ActiveRecord::Migration[5.1]
  def change
    add_column :scenarios, :play_time, :float
    add_column :scenarios, :tool, :string
  end
end
