class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.belongs_to :sender, null: false, foreign_key: { to_table: :users }, index: false, on_delete: :cascade
      t.belongs_to :chat, null: false, foreign_key: true, index: false, on_delete: :cascade

      t.text :text, null: false

      t.timestamps

      t.index %i[chat_id created_at], order: { created_at: :desc }
    end
  end
end
