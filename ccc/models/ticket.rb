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

	def delete()
		sql = "
		DELETE FROM tickets
		WHERE id = #{@id}
		;"

		SqlRunner.run(sql)
	end

	def self.get_by_id(id)
		sql = "
		SELECT * 
		FROM tickets
		WHERE id = #{id}
		;"

		result = SqlRunner.run(sql).first

		return Ticket.new(result) if result.length>0
	end

	
end