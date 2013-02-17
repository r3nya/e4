class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject_en
      t.string :subject_ru
      t.string :message_en
      t.string :message_ru
      t.integer :user_id
      t.integer :forum_id
      t.integer :moderator_id, :default => 1
      t.boolean :sticky, :default => false
      t.boolean :visible, :default => true
      t.boolean :commentable, :default => true
      t.boolean :article, :default => false

      t.timestamps
    end
  end
end
