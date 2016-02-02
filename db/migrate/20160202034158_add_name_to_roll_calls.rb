class AddNameToRollCalls < ActiveRecord::Migration
  def change
  	add_column :roll_calls, :name, :string
  end
end
