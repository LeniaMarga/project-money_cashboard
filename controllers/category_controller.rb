require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( '../models/transaction' )
require_relative( '../models/category' )
require_relative( '../models/shop' )

get '/categories' do # index
  @categories = Category.all
  erb( :"categories/index" )
end



# binding.pry
# nil
