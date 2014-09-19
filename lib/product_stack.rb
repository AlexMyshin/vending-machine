module ProductStack

	attr_accessor :stocked_products, :selection

	def initialize_product_stack
		@stocked_products = [ 
													["mars bar", 		1.25,	0],
												 	["polos",				0.75,	0],
												 	["cola",				1.50,	0],
												 	["diet cola",		1.50,	0],
												 	["snickers",		0.80,	0],
												 	["wine gums",		0.65, 0],
												 	["chewing gum",	0.25,	0]
												]
	end

	def choose(product)
		@selection = product
		raise "This product is not in stock" unless @stocked_products[find(product)][2] > 0
		@stocked_products[find(product)][2] -=1
	end

	def restock(product, quantity)
	@stocked_products[find(product)][2] += quantity
	end

	def find(product)
		@stocked_products.find_index{|item|item[0] == product}
	end
end