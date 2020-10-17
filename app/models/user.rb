class User < ApplicationRecord
	attr_accessor :user_facilites

	belongs_to :role
	# has_many :user_facilities
	# has_many :facilities, through: :user_facilities

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :dob, presence: true
	validates :gender, presence: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

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
