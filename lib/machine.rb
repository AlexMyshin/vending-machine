require 'product_stack'
require 'coin_stack'

class Machine

	attr_reader :user_selection, :user_payment, :user_selection

	include ProductStack
	include CoinStack
		
		def initialize
			self.initialize_product_stack
			self.initialize_coin_stack
			@user_payment = []
			@user_selection = ""
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

		def select_product
			puts "Please type in the name of your selection"
			@stocked_products.each{|product| puts "#{product[0]} : £#{product[1]}" }
			@user_selection = gets.chomp
		end

		def load_coin(coin)
			puts "Enter a quantity of #{coin[0]} to load"
			quantity = gets.chomp.to_i
			add_coin(coin[0], quantity)
		end

		def get_user_payment
			puts "Enter a coin and press enter. When finished, hit enter twice"
			coin = gets.chomp
				while !coin.empty? do
					coin = gets.chomp
					@user_payment << coin
				end
		end

		def payment_sufficient?
			find_payment_value
			return true if @payment_value >= @stocked_products[find(@user_selection)][1]
			false
		end



		def find_payment_value
			@payment_value = 0
			@user_payment.each{|coin| @payment_value += decimal_value(coin)}
		end
			
		

end