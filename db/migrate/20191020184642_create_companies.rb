class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :slug
      t.belongs_to :admin, foreign_key: { to_table: :users }
    end
  end
end
