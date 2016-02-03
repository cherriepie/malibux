class Client < ActiveRecord::Base
	has_many :servers, dependent: :destroy
	validates :name, presence: true
end
