class AddDetailsToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :uid, :string
    add_column :players, :nickname, :string
    add_column :players, :image, :string
  end
end
