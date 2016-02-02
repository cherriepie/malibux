class AddRollCallToRolls < ActiveRecord::Migration
  def change
  		add_reference :rolls, :roll_call, index: true, foreign_key: true
  end
end
