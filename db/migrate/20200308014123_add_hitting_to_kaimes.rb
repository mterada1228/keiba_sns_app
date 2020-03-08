class AddHittingToKaimes < ActiveRecord::Migration[5.1]
  def change
    add_column :kaimes, :hitting, :boolean
  end
end
