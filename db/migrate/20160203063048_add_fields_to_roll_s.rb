class AddFieldsToRollS < ActiveRecord::Migration
  def change
  	add_column :rolls, :server_name, :string
  	add_column :rolls, :client_name, :string
  end
end
