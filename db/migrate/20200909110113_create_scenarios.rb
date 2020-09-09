class CreateScenarios < ActiveRecord::Migration[5.1]
  def change
    create_table :scenarios do |t|
      t.string :title
      t.integer :player_number
      t.string :scenario_link
      t.boolean :gm
      t.integer :price
      t.string :summary

      t.timestamps
    end
  end
end
