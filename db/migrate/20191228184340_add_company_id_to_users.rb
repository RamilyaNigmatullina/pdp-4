class AddCompanyIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :company, index: true
  end
end
