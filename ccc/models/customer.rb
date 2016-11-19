require_relative('../db/sql_runner.rb')

class Customer
	attr_reader :name, :id
	attr_accessor :funds

	def initialize( options )
		@name = options['name']
		@funds = options['funds'].to_i
		@id = options['id'].to_i if options['id']
	end
	
	def can_afford?(price)
		return @funds > price
	end

	def buy_ticket(film)
		new_ticket = Ticket.new({
			"customer_id" => @id,
			"film_id" => film.id
			})
		new_ticket.save()

		@funds -= film.price
		update()

		return new_ticket
	end

	def save()
		sql = "
		INSERT INTO customers
		(name, funds)
		VALUES
		('#{@name}', #{@funds})
		returning *
		;"

		result = SqlRunner.run(sql)

		@id = result[0]['id'].to_i 
	end

	def update()
		sql = "
		UPDATE customers
		SET (name, funds)
		= ('#{@name}', #{@funds})
		WHERE id = #{@id}
		;"

		SqlRunner.run(sql)
	end

	def delete()
		sql = "
		DELETE FROM customers
		WHERE id = #{@id}
		;"

		SqlRunner.run(sql)
	end
	
	def self.get_by_id(id)
		sql = "
		SELECT * 
		FROM customers
		WHERE id = #{id}
		;"

		result = SqlRunner.run(sql).first

		return Customer.new(result) if result.length>0
	end
end