require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( '../models/transaction' )
require_relative( '../models/category' )
require_relative( '../models/shop' )


get '/categories' do # index
  @categories = Category.all
  @sum = Category.total_sum
  erb( :"categories/index" )
end

get '/categories/new' do # new  ----it calls the post (create)
  @transactions = Transaction.all
  @shop = Shop.all
  erb( :"categories/new" )
end

get '/categories/:id' do # show  ---it calls the delete
  @transactions = Transaction.all
  @category = Category.find( params[:id] )
  @sum = Category.total_sum( params[:id])
  erb( :"categories/show" )
end

delete '/categories/:id' do # delete
  category = Category.find( params[:id] )
  category.delete()
  redirect to '/categories'
end

# binding.pry
# nil
