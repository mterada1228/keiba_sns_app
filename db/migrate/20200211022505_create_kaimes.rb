class CreateKaimes < ActiveRecord::Migration[5.1]
  def change
    create_table :kaimes do |t|
      t.string :baken_type
      t.string :buy_type
      t.string :first_hoses
      t.string :second_hoses
      t.string :third_hoses
      t.integer :betting, default: 0
      t.references :micropost, foreign_key: true

      t.timestamps
    end
  end
end
