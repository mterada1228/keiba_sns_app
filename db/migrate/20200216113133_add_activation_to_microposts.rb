class AddActivationToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :activated, :boolean, default: false
  end
end
