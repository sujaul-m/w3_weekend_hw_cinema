require_relative("./customer")
require_relative("./ticket")
require_relative("../db/sql_runner")

class Film
  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM films"
    film_info = SqlRunner.run(sql)
    return Film.map_items(film_info)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(data)
    result = data.map{|film| Film.new(film)}
    return result
  end

end
