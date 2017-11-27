require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( '../models/transaction' )
require_relative( '../models/category' )
require_relative( '../models/shop' )
# require_relative( './models/wallet' )

get '/transactions' do # index
  @transactions = Transaction.all()
  erb( :index )
end

get '/transactions/new' do # new  ----it calls the post (create)
  @categories = Category.all
  @shop = Shop.all
  erb( :new )
end

get '/transactions/:id' do # show  ---it calls the delete
  @transaction = Transaction.find( params[:id] )
  erb( :show )
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
  erb( :edit )
end

put '/transactions/:id' do # update
  Transaction.new( params ).update
  redirect to '/transactions'
end

delete '/transactions/:id' do # delete
  transaction = Transaction.find( params[:id] )
  transaction.delete()
  redirect to '/transactions'
end
#
#
# binding.pry
# nil
