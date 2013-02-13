class AddBanfieldsForUser < ActiveRecord::Migration
  def change
    add_column :users, :banned_at, :datetime
    add_column :users, :is_active, :boolean, :default => true
    add_column :users, :ban_reason, :string
    add_column :users, :banned_by_id, :integer
  end
end
