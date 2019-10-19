class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.belongs_to :first_user, null: false, foreign_key: { to_table: :users }, index: false, on_delete: :cascade
      t.belongs_to :second_user, null: false, foreign_key: { to_table: :users }, index: false, on_delete: :cascade

      t.timestamps

      t.index %i[first_user_id second_user_id], unique: true
      t.index %i[second_user_id first_user_id], unique: true
    end
  end
end
