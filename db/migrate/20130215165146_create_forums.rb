class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :title_ru
      t.string :title_en
      t.string :desc_ru
      t.string :desc_en
      t.string :url
      t.integer :range, :default => '0'
      t.string :metaforum_id
      t.boolean :newsforum

      t.timestamps
    end
    add_index :forums, :url, :unique => true
  end
end
