module CoinStack

	attr_accessor :value, :stack

	def initialize_coin_stack
		@stack = {"£2" 	=> 0,
							"£1" 	=> 0,
							"50p" => 0,
							"20p" => 0,
							"10p" => 0,
							"5p" 	=> 0,
							"2p" 	=> 0,
							"1p" 	=> 0}
	end

	def add_coin(denomination, quantity)
		 @stack[denomination] += quantity
	end

	def decimal_value(coin)
		if coin.end_with?("p")
			 coin.chop.to_f / 100
		else
			coin[1..-1].to_f
		end
	end

	def value
		value = 0.0
		@stack.each{|denomination, quantity| value += (decimal_value(denomination) * quantity)}
		return value.round(2)
	end


	def find_change_required(value_paid, product_cost)
		@change_required = value_paid - product_cost
	end

	def coins_returned
		@value_of_change = 0.0
		@return_to_customer =[]
		while @change_required != 0.0
			coin = select_coin
			get_change(coin)
			@change_required -= decimal_value(coin)
		end
		@return_to_customer
	end

private

	def select_coin
		@stack.find{|denomination, quantity| decimal_value(denomination) <= @change_required && quantity > 0}[0]
	end

	def get_change(coin)
		remove_from_stack(coin)
		@return_to_customer << coin
		@value_of_change += decimal_value(coin)
	end

	def remove_from_stack(coin)
		@stack[coin] -= 1
	end






end