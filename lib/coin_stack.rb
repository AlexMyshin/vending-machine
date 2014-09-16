class CoinStack

	attr_accessor :value, :stack

	def initialize(one_pence, two_pence, five_pence, ten_pence, twenty_pence, fifty_pence, one_pound, two_pounds)
		@stack = {"1p" 	=> one_pence,
							"2p" 	=> two_pence, 
							"5p" 	=> five_pence,
							"10p" => ten_pence,
							"20p" => twenty_pence,
							"50p" => fifty_pence,
							"£1" 	=> one_pound,
							"£2" 	=> two_pounds}
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
		@stack.each{|denomination, quantity| value +=(decimal_value(denomination) * quantity)}
		return value
	end


	def change_required(value_paid, product_cost)
		value_paid - product_cost
	end




end