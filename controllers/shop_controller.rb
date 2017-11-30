require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( '../models/transaction' )
require_relative( '../models/category' )
require_relative( '../models/shop' )

get '/shops' do
  @shops = Shop.all
  erb( :"shops/index" )
end

get '/shops/new' do
  erb( :"shops/new" )
end

post '/shops' do
  @shop = Shop.new( params )
  @shop.save()
  redirect to "/shops"
end
