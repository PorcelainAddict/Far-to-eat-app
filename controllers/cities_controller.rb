require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/country.rb')
require_relative('../models/city.rb')

# get list of all cities
# get '/cities' do
#   @city = City.all()
#   erb(:'city-views/index')
# end
