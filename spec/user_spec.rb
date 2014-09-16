require 'user'

describe 'user' do 

	let(:person){User.new}

	it 'should be able to make a selection' do 
		person.select("mars bar")
		expect(person.selection).to include("mars bar")
	end

	it 'should be able to insert coins' do 
		person.insert("1p")
		expect(person.amount_paid).to include("1p")
	end

end