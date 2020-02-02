require_relative('../db/sql_runner.rb')

class Gastronomy

  attr_reader :id
  attr_accessor :name, :address, :food, :alcohol, :city_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @food = options['food']
    @alcohol =  options['alcohol']
    @city_id = options['city_id'].to_i
  end

  def save ()
    sql = "INSERT INTO gastronomies (name, address, food, alcohol, city_id)
    VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@name, @address, @food, @alcohol, @city_id]
    gastro = SqlRunner.run(sql, values).first
    @id = gastro['id'].to_i
  end

  def update_gastro ()
    sql = "UPDATE gastronomies
    SET
    (
      name,
      address,
      food,
      alcohol
      ) = (
        $1, $2, $3, $4
        )
    WHERE id = $5"
    values = [@name, @address, @food, @alcohol]
    SqlRunner.run(sql, values)
 end

 def self.all ()
   sql = "SELECT * FROM gastronomies"
   gastro = SqlRunner.run(sql)
   return gastro.map { |eats| Gastronomy.new(eats)}
 end

 def self.find(id)
   sql = "SELECT * FROM gastronomies WHERE id = $1"
   values = [id]
   eats = SqlRunner.run(sql, values)
   return Gastronomy.new(eats.first)
 end

 def self.delete_all()
   sql = "DELETE FROM gastronomies"
   SqlRunner.run(sql)
 end

 def self.eviction(id)
   sql = "DELETE FROM gastronomies
   WHERE id = $1"
   values = [id]
   SqlRunner.run(sql, values)
 end 



end
