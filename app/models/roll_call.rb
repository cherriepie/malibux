class RollCall < ActiveRecord::Base
	has_many :rolls, dependent: :destroy
end
