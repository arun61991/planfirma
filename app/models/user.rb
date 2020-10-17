class User < ApplicationRecord
	attr_accessor :user_facilites

	belongs_to :role
	# has_many :user_facilities
	# has_many :facilities, through: :user_facilities

	def self.facilities(user)
		if user
			ff = []
			UsersFacility.where('user_id = ?', user.id).each do |uf|
				ff << Facility.find(uf.facility_id)
			end
		end
		ff
	end
end
