require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/gastronomy.rb')


#GETS
get '/gastronomies' do
  @gastronomies = Gastronomy.all()
  erb(:'gastro-views/index')
end

get '/gastronomies/new' do
  erb(:'gastro-views/new')
end


get '/gastronomies/:id' do
  @gastronomy = Gastronomy.find(params[:id])

  erb(:'gastro-views/show')
end

#POSTS

post '/gastronomies/new' do
  @gastro = Gastronomy.new(params)
  @gastro.save()
  redirect to '/cities/:id'
end

post '/gastronomies/delete' do
  @gastro = params[:id]
  @gastro.eviction
end
