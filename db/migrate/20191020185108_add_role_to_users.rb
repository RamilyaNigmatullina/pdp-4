class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :string, null: false, default: "employee", limit: 15
  end
end
