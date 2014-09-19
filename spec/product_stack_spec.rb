require 'product_stack'

	describe 'product_stack' do 

	shared_examples 'a vending machine' do
		let(:products){described_class.new}
	

		it 'when created the amount of products is zero' do 
			expect(products.stocked_products[0][2]).to be 0
		end

		it 'each product should have a price' do 
			expect(products.stocked_products[0][1]).to eq 1.25
		end

		it 'can pick a product' do 
			products.choose("mars bar")
			expect(products.selection).to eq "mars bar"
			expect(products.stocked_products[0][2]).to be 4
		end

		it 'cant pick a product which is out of stock' do 
			expect{products.choose("chewing gum")}.to raise_error "This product is not in stock"
		end

		it 'can be restocked' do 
			products.restock("mars bar", 5)
			expect(products.stocked_products[0][2]).to be 10
		end

	end
end