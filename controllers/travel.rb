require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/country.rb')
also_reload('../models/*')



#GETS

get '/country' do
  @country = Country.all()
  erb(:index)
end







#POSTS
