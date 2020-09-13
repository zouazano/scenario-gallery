class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.integer :player_id, null: false
      t.integer :scenario_id, null: false

      t.timestamps

      t.index :player_id
      t.index :scenario_id
      t.index [:player_id, :scenario_id], unique: true
    end
  end
end
