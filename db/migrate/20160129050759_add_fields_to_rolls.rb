class AddFieldsToRolls < ActiveRecord::Migration
  def change
    add_column :rolls, :notes, :string
    add_column :rolls, :status, :integer, :default=>0
  end
end
