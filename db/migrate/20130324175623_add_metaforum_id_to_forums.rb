class AddMetaforumIdToForums < ActiveRecord::Migration
  def change
    add_column :forums, :metaforum_id, :integer
  end
end
