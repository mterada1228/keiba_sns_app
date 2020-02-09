class CreateHosemarks < ActiveRecord::Migration[5.1]
  def change
    create_table :hosemarks do |t|
      t.string :hose1_mark
      t.string :hose2_mark
      t.string :hose3_mark
      t.string :hose4_mark
      t.string :hose5_mark
      t.string :hose6_mark
      t.string :hose7_mark
      t.string :hose8_mark
      t.string :hose9_mark
      t.string :hose10_mark
      t.string :hose11_mark
      t.string :hose12_mark
      t.string :hose13_mark
      t.string :hose14_mark
      t.string :hose15_mark
      t.string :hose16_mark
      t.string :hose17_mark
      t.string :hose18_mark

      t.references :micropost, foreign_key: true

      t.timestamps
    end
  end
end
