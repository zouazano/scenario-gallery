class CreateScenarioWriters < ActiveRecord::Migration[5.1]
  def change
    create_table :scenario_writers do |t|
    t.references :scenario, index: true
    t.references :writer, index: true
      t.timestamps
    end
  end
end
