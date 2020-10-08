class AddWriterIdToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :writer_id, :integer
  end
end
