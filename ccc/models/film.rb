require_relative('../db/sql_runner.rb')

class Film
	attr_reader :title, :price, :id

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
	
end