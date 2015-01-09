class Account < ActiveRecord::Base
	belongs_to :user

	def owner
		user.fname + ' ' + user.lname
	end

end
