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




get '/gastronomies/:id' do
  @gastronomy = Gastronomy.find(params[:id])

  erb(:'gastro-views/show')
end

#POSTS



post '/gastronomies/delete/:id' do
  gastro_to_be_deleted = Gastronomy.find(params[:id])
  Gastronomy.eviction(params[:id])

  redirect to "/cities/#{gastro_to_be_deleted.city_id}"
end
