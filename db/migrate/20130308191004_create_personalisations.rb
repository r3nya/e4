class CreatePersonalisations < ActiveRecord::Migration
  def change
    create_table :personalisations do |t|
      t.string :data_ru
      t.string :data_en

      t.timestamps
    end
  end
end
