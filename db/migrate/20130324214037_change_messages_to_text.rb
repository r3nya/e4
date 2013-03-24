class ChangeMessagesToText < ActiveRecord::Migration
  def change
    change_column :posts, :message_en, :text
    change_column :posts, :message_ru, :text
  end
end
