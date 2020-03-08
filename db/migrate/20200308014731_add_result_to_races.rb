class AddResultToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :first_hose_num, :string
    add_column :races, :second_hose_num, :string
    add_column :races, :third_hose_num, :string
  end
end
