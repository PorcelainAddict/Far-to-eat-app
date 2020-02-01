require_relative('../db/sql_runner.rb')

class Gastronomy

  attr_reader :id
  attr_accessor :name, :address, :food, :alcohol

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @food = options['food']
    @alcohol =  options['alcohol']

  end
end
