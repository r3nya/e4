class RenameTrackerlineColumns < ActiveRecord::Migration
  def change
    remove_column :tracker_lines, :object_id
    remove_column :tracker_lines, :object_type
    add_column :tracker_lines, :obj_id, :integer
    add_column :tracker_lines, :obj_type, :string
  end
end
