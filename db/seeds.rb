require('pry-byebug')
require('pp')
require_relative('../models/category.rb')
require_relative('../models/transaction.rb')
require_relative('../models/shop.rb')

Transaction.delete
Shop.delete
Category.delete

food_drinks = Category.new({'tag_name' => 'food_drinks', 'amount_limit' => '200.00'})
food_drinks.save
grosseries = Category.new({'tag_name' => 'grosseries', 'amount_limit' => '400.00'})
grosseries.save
entertainment = Category.new({'tag_name' => 'entertainment', 'amount_limit' => '300.00'})
entertainment.save
cloths = Category.new({'tag_name' => 'cloths', 'amount_limit' => '300.00'})
cloths.save
transport = Category.new({'tag_name' => 'transport', 'amount_limit' => '500.00'})
transport.save
personal = Category.new({'tag_name' =>'personal', 'amount_limit' => '300.00'})
personal.save

shop_1 = Shop.new({'shop_name' => 'Devils Advocate', 'location' => 'old town'})
shop_1.save
shop_2 = Shop.new({'shop_name' => 'Tesco', 'location' => 'Lothian'})
shop_2.save
shop_3 = Shop.new({'shop_name' => 'Cameo', 'location' => 'Lothian'})
shop_3.save
shop_4 = Shop.new({'shop_name' => 'Shoe', 'location' => 'New Town'})
shop_4.save
shop_5 = Shop.new({'shop_name' => 'Train Station', 'location' => 'Weverley'})
shop_5.save


transaction_1 = Transaction.new({
  "date_input" => "12/01/17",
  "title" => "new shoes",
  "price" => "60.00",
  "category_id" => cloths.id,
  "shop_id" => shop_4.id
  })
transaction_1.save

transaction_2 = Transaction.new({
  "date_input" => "13/01/17",
  "title" => "weekend_grosseries",
  "price" => "40.00",
  "category_id" => grosseries.id,
  "shop_id" => shop_2.id
  })
transaction_2.save

transaction_3 = Transaction.new({
  "date_input" => "14/01/17",
  "title" => "tickets_london",
  "price" => "80.00",
  "category_id" => transport.id,
  "shop_id" => shop_5.id
  })
transaction_3.save

transaction_4 = Transaction.new({
  "date_input" => "14/01/17",
  "title" => "coffee",
  "price" => "3.00",
  "category_id" => food_drinks.id,
  "shop_id" => shop_4.id
  })
transaction_4.save

transaction_5 = Transaction.new({
  "date_input" => "14/01/17",
  "title" => "cinema",
  "price" => "10.00",
  "category_id" => entertainment.id,
  "shop_id" => shop_3.id
  })
transaction_5.save




# binding.pry
# nil
