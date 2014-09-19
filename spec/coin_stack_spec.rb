require 'coin_stack'

describe 'coin stack' do 

	class TestClass
	end

	before(:each) do
	  @test_coin_stack = TestClass.new
	  @test_coin_stack.extend(CoinStack)
	  @test_coin_stack.initialize_coin_stack
	end

		it 'when created the amount of coins is 0' do 
			expect(@test_coin_stack.value).to eq 0
			expect(@test_coin_stack.stack["1p"]).to eq 0
		end

		context 'adds a coin' do 

			it 'the number in the stack changes' do 
				@test_coin_stack.add_coin("2p", 1)
				p @test_coin_stack.stack
				expect(@test_coin_stack.stack["2p"]).to eq 1
			end

			it 'knows the value of pence coins inserted' do 
				expect(@test_coin_stack.decimal_value("2p")).to eq 0.02
			end

			it 'knows the value of pound coins inserted' do 
				expect(@test_coin_stack.decimal_value("£2")).to eq 2.0
			end

			it 'the value of the whole stack changes' do 
				@test_coin_stack.add_coin("2p", 1)
				expect(@test_coin_stack.value).to eq 0.02
			end

		end 

		context 'gives change' do 

			let(:product_cost){0.25}
			let(:value_paid){1.75}

			before(:each) do 
				@test_coin_stack.add_coin("£1", 1)
				@test_coin_stack.add_coin("50p", 1)
			end


			it 'calculates the change required' do 
				expect(@test_coin_stack.find_change_required(value_paid, product_cost)).to eq 1.5
			end

			it 'returns a hash of coins adding up to that value' do 
				@test_coin_stack.find_change_required(value_paid, product_cost)
				expect(@test_coin_stack.coins_returned).to include("£1", "50p")
			end

			it 'removes the coins from the @test_coin_stack' do 
				@test_coin_stack.find_change_required(value_paid, product_cost)
				@test_coin_stack.coins_returned
				expect(@test_coin_stack.stack["50p"]).to eq 0
				expect(@test_coin_stack.stack["£1"]).to eq 0
				expect(@test_coin_stack.value).to eq 0.0
			end


		end

	

end

