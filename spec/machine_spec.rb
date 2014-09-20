require 'machine'
require './spec/coin_stack_spec'

describe 'machine' do

let(:machine){Machine.new}

	it 'asks the user to stock products' do 
		machine.stub(:puts).with(anything())
		expect(machine).to receive(:puts).with("Enter a quantity of mars bar to load")
		allow(machine).to receive(:gets).and_return("1")
		machine.take_stock
	end

	it 'asks the user to stock coins' do 
		machine.stub(:puts).with(anything())
		expect(machine).to receive(:puts).with("Enter a quantity of £2 to load")
		allow(machine).to receive(:gets).and_return("1")
		machine.take_coins
	end

	it 'asks the user to make a selection' do 
		machine.stub(:puts).with(anything())
		expect(machine).to receive(:puts).with("Please type in the name of your selection")
		expect(machine).to receive(:puts).with("mars bar : £1.25")
		allow(machine).to receive(:gets).and_return("mars bar")
		machine.select_product
	end

	it 'asks the user to enter change' do 
		expect(machine).to receive(:puts).with("Enter a coin and press enter. When finished, hit enter twice")
		allow(machine).to receive(:gets).and_return("50p", "")
		machine.get_user_payment
	end

	it 'checks the value of the change is enough to buy the product' do 
		machine.user_payment.push('50p', '50p')
		machine.user_selection << "mars bar"
		expect(machine.payment_sufficient?).to be false
	end

end