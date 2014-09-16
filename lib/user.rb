class User

	attr_accessor :selection, :amount_paid

	def initialize
		@selection = []
		@amount_paid = []
	end

	def select(item)
		@selection << item
	end

	def insert(coin)
		@amount_paid << coin
	end


end