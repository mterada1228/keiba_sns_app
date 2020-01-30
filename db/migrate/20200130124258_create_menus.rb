class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.date :today_date

      t.timestamps
    end
  end
end
