require 'product_stack'

class Machine

	include ProductStack
		
		def initialize
			self.stocked_products

		end

		def display_products
		end

		def take_stock
			self.stocked_products
			@stocked_products.each do |product|
				load_product(product)
			end
		end

		def load_product(product)
				puts "Enter a quantity of #{product[0]} to load"
				product[2] = gets.chomp.to_i
		end
			
		

end