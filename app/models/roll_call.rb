class RollCall < ActiveRecord::Base
	has_many :rolls, dependent: :destroy

	def self.to_csv
		attributes = %w(id name)
		CSV.generate(headers:true) do |csv|
			csv << attributes

			all.each do |rc|
				csv<<attributes.map{|attr| rc.send(attr)}
			end
		end
	end

end
