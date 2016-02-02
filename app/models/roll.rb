class Roll < ActiveRecord::Base
	belongs_to :server
	belongs_to :roll_call
end
