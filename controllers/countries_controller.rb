require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
# also_reload('../models/*')



#GETS

get '/countries' do
  @countries = Country.all()
  erb(:'country-views/index')
end

get '/countries/new' do
  erb(:'country-views/new')
end

get '/countries/edit/:id' do
  @country = Country.find(params[:id])
  erb(:'country-views/edit')
end

get '/countries/:id' do
  country_id = params[:id]
  @country = Country.find(country_id)
  erb(:'city-views/index')
end


#POSTS

post '/countries/new' do
  @NewCountry =Country.new(params)
  @NewCountry.save()
  redirect to '/countries'
end

post '/countries/edit/:id' do
  # binding.pry
  @country = Country.new(params)
  @country.update()
  redirect to '/countries'
end



post '/countries/delete/' do

  @country = Country.find(params[:id])
  @country.act_of_god
  erb(:'country-views/delete')
end
