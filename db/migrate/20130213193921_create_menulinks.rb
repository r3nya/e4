# coding: UTF-8
class CreateMenulinks < ActiveRecord::Migration
  def change
    create_table :menulinks do |t|
      t.string :title_en, :default => "NEED ENGLISH TRANSLATION"
      t.string :title_ru, :default => "НУЖЕН РУССКИЙ ПЕРЕВОД"
      t.string :url
      t.integer :range, :default => 0

      t.timestamps
    end
  end
end
