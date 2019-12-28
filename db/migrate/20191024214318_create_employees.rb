class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.belongs_to :user
      t.belongs_to :company
      t.string :role, null: false, default: "employee"
    end
  end
end
