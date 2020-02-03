require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/travel.rb')



get '/' do
  erb ( :index )
end
