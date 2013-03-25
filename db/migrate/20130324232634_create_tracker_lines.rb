class CreateTrackerLines < ActiveRecord::Migration
  def change
    create_table :tracker_lines do |t|
      t.integer :object_id
      t.string :object_type

      t.timestamps
    end
  end
end
