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

get '/cities/edit/:id' do
  @city = City.find(params[:id])
  erb(:'/city-views/edit')
end

get '/cities/:id' do
  city_id = params[:id]
  @city = City.find(city_id)
  erb(:'city-views/show')
end

#POSTS

post '/countries/:id' do
  @NewCity =City.new(params)
  @NewCity.save()
  redirect to '/countries/:id'
end

post '/cities/edit/:id' do
  city_id = params[:id]
  @city = City.find(city_id)
  @city.update()
end
