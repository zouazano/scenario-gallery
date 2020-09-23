class CreateReviewRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :review_relationships do |t|
      t.integer :player_id, null: false
      t.integer :review_id, null: false
      t.timestamps

      t.index :player_id
      t.index :review_id
      t.index [:player_id, :review_id], unique: true
    end
  end
end
