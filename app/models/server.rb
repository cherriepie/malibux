class Server < ActiveRecord::Base
	has_many :rolls, dependent: :nullify
	belongs_to :client

	validates :name, presence: true

end
