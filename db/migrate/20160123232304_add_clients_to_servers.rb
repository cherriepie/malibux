class AddClientsToServers < ActiveRecord::Migration
  def change
  	add_reference :servers, :client, index: true, foreign_key: true

  end
end
