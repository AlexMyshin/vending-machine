class CoinStack

	attr_accessor :value, :stack

	def initialize(two_pounds, one_pound, fifty_pence, twenty_pence, ten_pence, five_pence, two_pence, one_pence)
		@stack = {"£2" 	=> two_pounds,
							"£1" 	=> one_pound,	
							"50p" => fifty_pence,
							"20p" => twenty_pence,
							"10p" => ten_pence, 
							"5p" 	=> five_pence,
							"2p" 	=> two_pence,
							"1p" 	=> one_pence}
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
		while @value_of_change < @change_required.to_f
			get_change(select_coin)
		end
		return @return_to_customer
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