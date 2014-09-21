require_relative 'product_stack'
require_relative 'coin_stack'

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
			ask_for_coins
			add_coins_to_user_payment
			remove_empty_payment_values
		end

		def ask_for_coins
			puts "Enter a coin and press enter. When finished, hit enter twice"
		end

		def add_coins_to_user_payment
			inserted_coin = gets.chomp
			while !inserted_coin.empty? do
					@user_payment << inserted_coin
					inserted_coin = gets.chomp
			end
		end

		def validate
			return choose(@user_selection) if payment_sufficient?
			get_user_payment
		end

		def payment_sufficient?
			payment_value >= @stocked_products[find(@user_selection)][1]
		end

		def payment_value
			@user_payment.inject(0){|payment_value, coin| p payment_value += decimal_value(coin)}
		end

		def remove_empty_payment_values
			@user_payment.reject! { |coin| coin.empty? }
		end

		#program sequence methods

		def run
			initial_setup
			vend_products
		end

		def initial_setup
			take_stock
			take_coins
		end

		def vend_products
			take_user_inputs
			return_product
			return_change
		end

		def take_user_inputs
			select_product
			get_user_payment
			validate
		end

		def return_product
			p "Here is your #{@user_selection}:"
			p choose(@user_selection)
		end

		def return_change
			p "Here is your #{find_change_required(find_payment_value, @stocked_products[find(@user_selection)][1])} change"
			p coins_returned
		end

end






