require 'product_stack'
require 'coin_stack'

class Machine

	include ProductStack
	include CoinStack
		
		def initialize
			self.initialize_product_stack
			self.initialize_coin_stack
		end

		def take_stock
			@stocked_products.each do |product|
				load_product(product)
			end
		end

		def load_product(product)
				puts "Enter a quantity of #{product[0]} to load"
				quantity = gets.chomp.to_i
				restock(product[0], quantity)
		end

		def take_coins
			@stack.each do |coin|
				load_coin(coin)
			end
		end

		def load_coin(coin)
			puts "Enter a quantity of #{coin[0]} to load"
			quantity = gets.chomp.to_i
			add_coin(coin[0], quantity)
		end
			
		

end