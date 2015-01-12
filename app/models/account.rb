class Account < ActiveRecord::Base
	belongs_to :user
	has_many :transactions

	def owner
		user.fullName
	end

	def balance
		transactions.sum("amount")
	end

end
