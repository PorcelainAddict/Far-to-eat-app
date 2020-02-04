require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/gastronomy.rb')


#gets

get '/cities' do
  @cities = City.all()
  erb(:'city-views/index')
end

get '/cities/new' do
  erb(:'city-views/new')
end

get '/cities/:id' do
  city_id = params[:id]
  @city = City.find(city_id)
  erb(:'city-views/show')
end

#POSTS

post '/countries/:id' do
  @NewCountry =City.new(params)
  @NewCountry.save()
  redirect to '/countries/:id'
end
