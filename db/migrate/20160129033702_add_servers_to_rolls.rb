class AddServersToRolls < ActiveRecord::Migration
  def change
  	add_reference :rolls, :server, index: true, foreign_key: true

  end
end
