class Admin < ActiveRecord::Base
	has_secure_password
	validates :name, :password, presence: true
	validates_confirmation_of :password
end
