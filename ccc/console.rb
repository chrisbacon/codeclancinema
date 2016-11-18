require_relative('models/customer')
require('pry-byebug')

cust1 = Customer.new({
	'name' => 'Chris',
	'funds' => 2000
	})

cust1.save()

binding.pry
nil