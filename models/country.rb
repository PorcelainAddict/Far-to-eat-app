require_relative('../db/sql_runner.rb')

class Country

  attr_reader :id
  attr_accessor :name, :travelled

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @name = options['name']
    @travelled = options['travelled']
  end

  def save ()
    sql = "INSERT INTO countries (name, travelled)
    VALUES ($1, $2) RETURNING id"
    values = [@name, @travelled]
    country = SqlRunner.run(sql, values).first
    @id = country['id'].to_i
  end

  def update()
    sql = "UPDATE countries
    SET
    (
      name,
      travelled
      ) = (
        $1, $2
      )
      WHERE id = $3"
      values = [@name, @travelled, @id]
      SqlRunner.run(sql, values)
  end

  def cities()
    sql = "SELECT * FROM cities WHERE country_id = $1"
    values = [@id]
    cities_data = SqlRunner.run(sql, values)
    return cities_data.map { |city| City.new(city)}
  end

  def self.all()
    sql = "SELECT * FROM countries"
    countries = SqlRunner.run(sql)
    return countries.map { |state| Country.new(state)}
  end

  def self.find(id)
    sql = "SELECT * FROM countries WHERE id = $1"
    values = [id]
    pais = SqlRunner.run(sql, values)
    return Country.new(pais.first)
  end

  def self.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end

  def self.act_of_god(id)
    sql = "DELETE FROM countries
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


end
