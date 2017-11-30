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

get '/categories/new' do # new  ----it calls the post (create)
  erb( :"categories/new" )
end

post '/categories' do # create
  @category = Category.new( params )
  @category.save()
  redirect to "/categories"
end


# binding.pry
# nil
