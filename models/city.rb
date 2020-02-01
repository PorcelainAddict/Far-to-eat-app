require_relative('../db/sql_runner.rb')

class City

  attr_reader :id
  attr_accessor :name, :travelled

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @name = options['name']
    @travelled = options['travelled']
  end


end
