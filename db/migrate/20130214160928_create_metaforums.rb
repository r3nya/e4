class CreateMetaforums < ActiveRecord::Migration
  def change
    create_table :metaforums do |t|
      t.string :title_en
      t.string :title_ru
      t.string :desc_ru
      t.string :desc_en

      t.timestamps
    end
  end
end
