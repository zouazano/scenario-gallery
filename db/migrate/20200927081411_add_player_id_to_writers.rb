class AddPlayerIdToWriters < ActiveRecord::Migration[5.1]
  def change
    add_column :writers, :player_id, :integer
  end
end
