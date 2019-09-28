require_relative("./film")
require_relative("./customer")
require_relative("../db/sql_runner")

class Ticket
  attr_accessor :customer_id, :film_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['name']
    @film_id = options['funds']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def customer()
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [@customer_id]
    customer = SqlRunner.run( sql,values )
    result = Customer.new( customer.first )
    return result
  end

  def film()
    sql = "SELECT * FROM films
    WHERE id = $1"
    values = [@film_id]
    film = SqlRunner.run( sql,values )
    result = Film.new( film.first )
    return result
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3"
    values = [@customer_id, @film_id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tickets where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    customer_info = SqlRunner.run(sql)
    return Customer.map_items(customer_info)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.map_items(data)
    result = data.map{|ticket| Ticket.new(ticket)}
    return result
  end

end
