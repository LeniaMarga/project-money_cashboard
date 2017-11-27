require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( '../models/transaction' )
require_relative( '../models/category' )
require_relative( '../models/shop' )
# require_relative( './models/wallet' )

get '/categories' do # index
  @categories = Category.all
  erb( :categories_intex )
end

get '/categories/new' do # new  ----it calls the post (create)
  @transactions = Transaction.all
  @shop = Shop.all
  erb( :categories_new )
end

get '/categories/:id' do # show  ---it calls the delete
  @category = Category.find( params[:id] )
  erb( :categories_show )
end

post '/categories' do # create
  @category = Category.new( params )
  @category.save()
  redirect to "/categories"
end


get '/categories/:id/edit' do # edit  calls the put(update)
  @category = Category.find( params[:id] )
  @transactions = Transaction.all
  @shop = Shop.all
  erb( :categories_edit)
end

put '/categories/:id' do # update
  Category.new( params ).update
  redirect to '/categories'
end

delete '/categories/:id' do # delete
  category = Category.find( params[:id] )
  category.delete()
  redirect to '/categories'
end
#
#
# binding.pry
# nil
