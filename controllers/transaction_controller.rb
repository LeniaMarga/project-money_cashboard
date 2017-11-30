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

get '/transactions/search' do # show  ---it calls the delete
  @transactions = Transaction.search_date(params[:date_input])
  erb( :"transactions/search_results" )
end

get '/transactions/new' do # new  ----it calls the post (create)
  @categories = Category.all
  @shops = Shop.all
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
  @shops = Shop.all
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

get '/transactions/category/:id' do # show  ---it calls the delete
  @category = Category.find(params[:id])
  @transactions = Transaction.all
  erb( :"transactions/category" )
end

get '/transactions/shop/:id' do # show  ---it calls the delete
  @shop= Shop.find(params[:id])
  erb( :"transactions/shop" )
end





#
# nil
