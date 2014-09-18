require 'product_stack'

	describe 'product_stack' do 

	it 'when created the amount of products can be added' do 
		products = Product_stack.new(5,10,4,4,4,2,10)
		expect(products.stocked_products["mars bar"]).to eq 5
		expect(products.stocked_products["polos"]).to eq 10
		expect(products.stocked_products["cola"]).to eq 4
	end

end