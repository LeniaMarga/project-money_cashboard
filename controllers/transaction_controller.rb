require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( '../models/transaction' )
require_relative( '../models/category' )
require_relative( '../models/shop' )
# require_relative( './models/wallet' )

get '/transactions' do # index
  @transactions = Transaction.all()
  @sum = Transaction.total()
  erb( :"transactions/index" )
end

get '/transactions/new' do # new  ----it calls the post (create)
  @categories = Category.all
  @shop = Shop.all
  erb( :"transactions/new" )
end

get '/transactions/:id' do # show  ---it calls the delete
  @transaction = Transaction.find( params[:id] )
  erb( :"transactions/show" )
end

post '/transactions' do # create
  @transaction = Transaction.new( params )
  @transaction.save()
  redirect to "/transactions"
end

get '/transactions/:id/edit' do # edit  calls the put(update)
  @transaction = Transaction.find( params[:id] )
  @categories = Category.all
  @shop = Shop.all
  erb( :"transactions/edit" )
end

put '/transactions/:id' do # update
  Transaction.new( params ).update
  redirect to '/transactions'
end

delete '/transactions/:id' do # delete
  transaction = Transaction.find( params[:id] )
  transaction.delete()
  erb( :"transactions/delete" )
  # redirect to '/transactions'
end

get '/transactions/:category' do # show  ---it calls the delete
  @transaction = Transaction.all
  @category =  @transaction.category(params[:id])
  erb( :"transactions/category" )
end

get '/transactions/category/:id' do # show  ---it calls the delete
  @transaction = Transaction.all
  @category =  Category.find( params[:id] )
  @sum = Transaction.total_per_category(@category.id)
  erb( :"transactions/category/id" )
end

get '/transactions/budget' do # show  ---it calls the delete
  @transaction = Transaction.all
  @category =  Category.find( params[:id] )
  @sum = Transaction.total_per_category(@category.id)
  erb( :"transactions/category" )
end

#
#
# binding.pry
# nil
