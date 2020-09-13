class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :player_id, null: false
      t.integer :scenario_id, null: false
      t.float :score
      t.text :content
      t.boolean :spoiler

      t.timestamps

      t.index :player_id
      t.index :scenario_id
      t.index [:player_id, :scenario_id], unique: true
    end
  end
end
