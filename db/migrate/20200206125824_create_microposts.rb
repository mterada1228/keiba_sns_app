class CreateMicroposts < ActiveRecord::Migration[5.1]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :race
      t.timestamps
    end
    add_foreign_key :microposts, :races, column: :race_id
  end
end
