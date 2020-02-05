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

# get the edit city form
get '/cities/edit/:id' do
  @city = City.find(params[:id])
  erb(:'/city-views/edit')
end

get '/cities/:id' do
  city_id = params[:id]
  @city = City.find(city_id)
  erb(:'city-views/show')
end

# get the new gastronomy form for this city
get '/cities/:city_id/gastronomies/new' do
  city_id = params[:city_id]
  @city = City.find(city_id)
  erb(:'gastro-views/new')
end

#POSTS

# save a new gastronomy to this city.
post '/cities/:city_id/gastronomies/new' do
  @gastronomy = Gastronomy.new(params)
  @gastronomy.save()
  redirect to "/cities/#{params[:city_id]}"
end


post '/cities/edit/:id' do
  binding.pry
  @city = City.new(params)
  @city.update()
  redirect to '/countries'
end
