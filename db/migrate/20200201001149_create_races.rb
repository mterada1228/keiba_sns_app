class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|

      t.string :place
      t.integer :round
      t.string :race_name
      t.string :cource_type
      t.integer :cource_length
      t.string :hose_name1
      t.string :hose_name2
      t.string :hose_name3
      t.string :hose_name4
      t.string :hose_name5
      t.string :hose_name6
      t.string :hose_name7
      t.string :hose_name8
      t.string :hose_name9
      t.string :hose_name10
      t.string :hose_name11
      t.string :hose_name12
      t.string :hose_name13
      t.string :hose_name14
      t.string :hose_name15
      t.string :hose_name16
      t.string :hose_name17
      t.string :hose_name18
      t.integer :menu_id

      t.timestamps
    end
  end
end
