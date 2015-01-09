class Account < ActiveRecord::Base
	belongs_to :user
	has_many :transactions
	
	def owner
		user.fname + ' ' + user.lname
	end

end
