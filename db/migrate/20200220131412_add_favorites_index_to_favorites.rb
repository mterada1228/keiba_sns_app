class AddFavoritesIndexToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_index :favorites, [:user_id, :micropost_id], unique: true
  end
end
