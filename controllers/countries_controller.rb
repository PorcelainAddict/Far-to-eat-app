require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
# also_reload('../models/*')



#GETS

get '/countries' do
  @country = Country.all()
  erb(:'country-views/index')
end

get '/countries/:id' do
  country_id = params[:id]
  @country = Country.find(country_id)
  erb(:'city-views/index')
end

# get '/country/'










#POSTS
