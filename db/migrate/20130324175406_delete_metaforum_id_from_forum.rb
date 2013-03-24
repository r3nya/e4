class DeleteMetaforumIdFromForum < ActiveRecord::Migration
  def change
    remove_column :forums, :metaforum_id
  end
end
