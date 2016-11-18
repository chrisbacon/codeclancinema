require_relative('models/customer')
require_relative('models/film')
require('pry-byebug')

cust1 = Customer.new({
	'name' => 'Chris',
	'funds' => 200.00
	})

cust1.save()

film1 = Film.new({
	'title' => 'Mad Max',
	'price' => 8.00
	})

film1.save()

binding.pry
nil