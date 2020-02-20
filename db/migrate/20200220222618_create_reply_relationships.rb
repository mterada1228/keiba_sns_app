class CreateReplyRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :reply_relationships do |t|
      t.integer :reply_post_id
      t.integer :replied_post_id

      t.timestamps
    end
    add_index :reply_relationships, :reply_post_id
    add_index :reply_relationships, :replied_post_id
    add_index :reply_relationships, [:reply_post_id, :replied_post_id], unique: true
  end
end
