require 'product_stack'

	describe 'product_stack' do 

	class TestClass
	end

	before(:each) do
	  @test_product_stack = TestClass.new
	  @test_product_stack.extend(ProductStack)
	  @test_product_stack.initialize_product_stack
	end	

		it 'when created the amount of products is zero' do 
			expect(@test_product_stack.stocked_products[0][2]).to be 0
		end

		it 'each product should have a price' do 
			expect(@test_product_stack.stocked_products[0][1]).to eq 1.25
		end

		context 'when in use' do 

			before(:each) do 
				@test_product_stack.restock("mars bar", 5)
			end

		it 'can be restocked' do 
			@test_product_stack.restock("mars bar", 5)
			expect(@test_product_stack.stocked_products[0][2]).to be 10
		end

		it 'can pick a product' do 
			@test_product_stack.choose("mars bar")
			expect(@test_product_stack.selection).to eq "mars bar"
			expect(@test_product_stack.stocked_products[0][2]).to be 4
		end

		it 'cant pick a product which is out of stock' do 
			expect{@test_product_stack.choose("chewing gum")}.to raise_error "This product is not in stock"
		end

	end

end