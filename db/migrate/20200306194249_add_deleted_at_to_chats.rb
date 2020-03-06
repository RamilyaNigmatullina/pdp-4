class AddDeletedAtToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :deleted_at, :datetime
    add_index :chats, :deleted_at
  end
end
