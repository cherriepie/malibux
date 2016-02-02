class AddServersToTasks < ActiveRecord::Migration
  def change
  	add_reference :tasks, :server, index: true, foreign_key: true
  end
end
