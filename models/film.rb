require_relative('../db/sql_runner.rb')

class Film
	attr_reader :title, :id, :price

	def initialize( options )
		@title = options['title']
		@price = options['price'].to_i
		@id = options['id'].to_i if options['id']
	end
	
	def save()
		sql = "
		INSERT INTO films
		(title, price)
		VALUES
		('#{@title}', #{@price})
		returning *
		;"

		result = SqlRunner.run(sql)

		@id = result[0]['id'].to_i 
	end

	def number_of_tickets_sold()
		sql = "
		SELECT * FROM tickets
		where film_id = #{@id}
		;"

		result = SqlRunner.run(sql)

		return result.count
	end

	def update()
		sql = "
		UPDATE films
		SET (title, price)
		= ('#{@title}', #{@price})
		WHERE id = #{@id}
		;"

		SqlRunner.run(sql)
	end

	def delete()
		sql = "
		DELETE FROM films
		WHERE id = #{@id}
		;"

		SqlRunner.run(sql)
	end

	def self.get_by_id(id)
		sql = "
		SELECT * 
		FROM films
		WHERE id = #{id}
		;"

		result = SqlRunner.run(sql).first

		return Film.new(result) if result.length>0
	end
	
end