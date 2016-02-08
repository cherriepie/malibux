class AddFieldsToRolls < ActiveRecord::Migration
  def change
    add_column :rolls, :notes, :string
    add_column :rolls, :status, :string, :default=>"Unchecked"
  end
end
