class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, limit: 255
      t.string :slug, limit: 15
    end
  end
end
