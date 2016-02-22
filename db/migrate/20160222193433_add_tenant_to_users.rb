class AddTenantToUsers < ActiveRecord::Migration
  def change
  	add_reference :users, :tenant, index: true, foreign_key: true
  end
end
