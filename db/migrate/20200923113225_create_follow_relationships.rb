class CreateFollowRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :follow_relationships do |t|
      t.references :player, foreign_key: true
      t.references :follow, foreign_key: { to_table: :players }

      t.timestamps

      t.index [:player_id, :follow_id], unique: true
    end
  end
end
