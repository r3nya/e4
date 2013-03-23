class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :title_en
      t.string :title_ru
      t.string :uri
      t.string :content_ru
      t.string :content_en

      t.timestamps
    end
  end
end
