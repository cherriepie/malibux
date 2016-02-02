class CreateRollCalls < ActiveRecord::Migration
  def change
    create_table :roll_calls do |t|

      t.timestamps null: false
    end
  end
end
