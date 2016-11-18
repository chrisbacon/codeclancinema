require_relative('../db/sql_runner.rb')

class Ticket
	attr_reader :customer_id, :film_id, :id

	def initialize( options )
		@customer_id = options['customer_id'].to_i
		@film_id = options['film_id'].to_i
		@id = options['id'].to_i if options['id']
	end
	
	def save()
		sql = "
		INSERT INTO tickets
		(customer_id, film_id)
		VALUES
		('#{@customer_id}', #{@film_id})
		returning *
		;"

		result = SqlRunner.run(sql)

		@id = result[0]['id'].to_i 
	end

	
end