require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( '../models/transaction' )
require_relative( '../models/category' )
require_relative( '../models/shop' )


get '/transactions' do
  @transactions = Transaction.all()
  @sum = Transaction.total()
  erb( :"transactions/index" )
end

get '/transactions/search' do
  @transactions = Transaction.search_date(params[:date_input])
  erb( :"transactions/search_results" )
end

get '/transactions/new' do
  @categories = Category.all
  @shops = Shop.all
  erb( :"transactions/new" )
end

get '/transactions/:id' do
  @transaction = Transaction.find( params[:id] )
  erb( :"transactions/show" )
end

post '/transactions' do
  @transaction = Transaction.new( params )
  @transaction.save()
  redirect to "/transactions"
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find( params[:id] )
  @categories = Category.all
  @shops = Shop.all
  erb( :"transactions/edit" )
end

put '/transactions/:id' do
  Transaction.new( params ).update
  redirect to '/transactions'
end

delete '/transactions/:id' do
  transaction = Transaction.find( params[:id] )
  transaction.delete()
  erb( :"transactions/delete" )
end

get '/transactions/category/:id' do
  @category = Category.find(params[:id])
  @transactions = Transaction.all
  erb( :"transactions/category" )
end

get '/transactions/shop/:id' do 
  @shop= Shop.find(params[:id])
  erb( :"transactions/shop" )
end





#
# nil
