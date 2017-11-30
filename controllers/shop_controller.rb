require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( '../models/transaction' )
require_relative( '../models/category' )
require_relative( '../models/shop' )

get '/shops' do # index
  @shops = Shop.all
  erb( :"shops/index" )
end

get '/shops/new' do # new  ----it calls the post (create)
  erb( :"shops/new" )
end

post '/shops' do # create
  @shop = Shop.new( params )
  @shop.save()
  redirect to "/shops"
end

# binding.pry
# nil
