class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|

      t.string :place
      t.integer :round
      t.string :race_name
      t.string :cource_type
      t.integer :cource_length
      t.references :menu, foreign_key: true
      t.string :hose1_name
      t.integer :hose1_gate_number
      t.string :hose1_gate_color
      t.string :hose1_number
      t.string :hose2_name
      t.integer :hose2_gate_number
      t.string :hose2_gate_color
      t.string :hose2_number
      t.string :hose3_name
      t.integer :hose3_gate_number
      t.string :hose3_gate_color
      t.string :hose3_number
      t.string :hose4_name
      t.integer :hose4_gate_number
      t.string :hose4_gate_color
      t.string :hose4_number
      t.string :hose5_name
      t.integer :hose5_gate_number
      t.string :hose5_gate_color
      t.string :hose5_number
      t.string :hose6_name
      t.integer :hose6_gate_number
      t.string :hose6_gate_color
      t.string :hose6_number
      t.string :hose7_name
      t.integer :hose7_gate_number
      t.string :hose7_gate_color
      t.string :hose7_number
      t.string :hose8_name
      t.integer :hose8_gate_number
      t.string :hose8_gate_color
      t.string :hose8_number
      t.string :hose9_name
      t.integer :hose9_gate_number
      t.string :hose9_gate_color
      t.string :hose9_number
      t.string :hose10_name
      t.integer :hose10_gate_number
      t.string :hose10_gate_color
      t.string :hose10_number
      t.string :hose11_name
      t.integer :hose11_gate_number
      t.string :hose11_gate_color
      t.string :hose11_number
      t.string :hose12_name
      t.integer :hose12_gate_number
      t.string :hose12_gate_color
      t.string :hose12_number
      t.string :hose13_name
      t.integer :hose13_gate_number
      t.string :hose13_gate_color
      t.string :hose13_number
      t.string :hose14_name
      t.integer :hose14_gate_number
      t.string :hose14_gate_color
      t.string :hose14_number
      t.string :hose15_name
      t.integer :hose15_gate_number
      t.string :hose15_gate_color
      t.string :hose15_number
      t.string :hose16_name
      t.integer :hose16_gate_number
      t.string :hose16_gate_color
      t.string :hose16_number
      t.string :hose17_name
      t.integer :hose17_gate_number
      t.string :hose17_gate_color
      t.string :hose17_number
      t.string :hose18_name
      t.integer :hose18_gate_number
      t.string :hose18_gate_color
      t.string :hose18_number
      t.timestamps
    end
  end
end
