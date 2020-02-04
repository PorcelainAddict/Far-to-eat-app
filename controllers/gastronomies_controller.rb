require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/gastronomy.rb')


get '/gastronomies' do
  @gastronomies = Gastronomy.all()
  erb(:'gastro-views/index')
end

get '/gastronomies/:id' do
  @gastronomy = Gastronomy.find(params[:id])

  erb(:'gastro-views/show')
end
