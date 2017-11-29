require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( './models/transaction' )
require_relative( './models/category' )
require_relative( './models/shop' )

require_relative( './controllers/transaction_controller' )
require_relative( './controllers/category_controller' )


get '/' do # index
  @transactions = Transaction.all
  @categories = Category.all
  @shop = Shop.all
  @sum = Transaction.total()
  erb( :home )
end
