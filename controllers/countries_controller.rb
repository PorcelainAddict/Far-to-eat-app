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

# this route will show the new city form for the country we are "in"
get '/countries/:id/cities/new' do
  @country = Country.find(params[:id])
  erb(:'city-views/new')
end


#POSTS

post '/countries/new' do
  @NewCountry =Country.new(params)
  @NewCountry.save()
  redirect to '/countries'
end

post '/countries/edit/:id' do

  @country = Country.new(params)
  @country.update()
  redirect to '/countries'
end

#add new city to countries
post '/countries/:country_id/cities/new' do
  @NewCity = City.new(params)
  @NewCity.save()
  redirect to "/countries/#{params[:country_id]}"
end

post '/countries/delete/:id' do

  Country.act_of_god(params[:id])
  
  erb(:'country-views/delete')
end

post '/cities/delete/:id' do


  City.act_of_god(params[:id])

  redirect to '/countries'

end
