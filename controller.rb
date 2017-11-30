require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( './models/transaction' )
require_relative( './models/category' )
require_relative( './models/shop' )
require_relative( './models/wallet' )

require_relative( './controllers/transaction_controller' )
require_relative( './controllers/category_controller' )
require_relative( './controllers/shop_controller' )

@@budget = 3000.00

get '/' do # index
  @transactions = Transaction.all
  @categories = Category.all
  @shops = Shop.all
  @sum = Transaction.total().to_f
  erb( :home )
end
