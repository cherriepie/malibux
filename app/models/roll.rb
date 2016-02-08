class Roll < ActiveRecord::Base
	belongs_to :server
	belongs_to :roll_call

	def self.to_csv
		attributes = %w(client_name server_name status notes updated_at)
		CSV.generate(headers:true) do |csv|
			csv << attributes

			all.each do |rc|
				csv<<attributes.map{|attr| rc.send(attr)}
			end
		end
	end
end
