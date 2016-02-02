class Server < ActiveRecord::Base
	has_many :tasks
	has_many :rolls
	belongs_to :client
end
