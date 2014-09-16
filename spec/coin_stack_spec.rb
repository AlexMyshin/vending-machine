require 'coin_stack'

describe 'filling the coin stack' do 

	let(:coin_stack){CoinStack.new(5, 5, 5, 10, 20, 7, 0, 10)}


	it 'when created the amount of coins can be set' do 
		expect(coin_stack.value).to eq 21.95
		expect(coin_stack.stack["1p"]).to eq 10
		expect(coin_stack.stack["2p"]).to eq 0
		expect(coin_stack.stack["£1"]).to eq 5
	end

	context 'adds a coin' do 

		it 'the number in the stack changes' do 
			coin_stack.add_coin("2p", 1)
			expect(coin_stack.stack["2p"]).to eq 1
		end

		it 'knows the value of pence coins inserted' do 
			expect(coin_stack.decimal_value("2p")).to eq 0.02
		end

		it 'knows the value of pound coins inserted' do 
			expect(coin_stack.decimal_value("£2")).to eq 2.0
		end

		it 'the value of the whole stack changes' do 
			coin_stack.add_coin("2p", 1)
			expect(coin_stack.value).to eq 21.97
		end

	end 

	context 'gives change' do 

		let(:product_cost){0.25}
		let(:value_paid){0.75}

		it 'calculates the change required' do 
			expect(coin_stack.find_change_required(value_paid, product_cost)).to eq 0.5
		end

		it 'returns a hash of coins adding up to that value' do 
			coin_stack.find_change_required(value_paid, product_cost)
			expect(coin_stack.coins_returned).to include("50p")
		end


	end


end

