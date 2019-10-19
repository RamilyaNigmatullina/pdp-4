class CreateIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :identities do |t|
      t.string :provider, null: false, limit: 30
      t.string :uid, null: false
      t.datetime :created_at, null: false

      t.belongs_to :user, null: false, foreign_key: true, index: false, on_delete: :cascade
    end

    add_index :identities, %i[uid provider], unique: true
    add_index :identities, %i[user_id provider], unique: true
  end
end
