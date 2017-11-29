
require_relative('transaction')
require_relative('category')
require_relative('shop')

class Wallet

  attr_accessor :budget

  def initialize(options)
    @transaction= options['transaction']
    @category = options['category']
    @shop = options['shop']
    @budget = 500
  end


  def self.total_spent
    sum = 0
    @transactions.each { |transaction| sum += transaction.price }
    return sum
  end

  def shop_total( shop_id )
    sum = 0
    @transactions.each do |transaction|
      if transaction.shop_id == shop_id
        sum += transaction.price
      end
    end
    return sum
  end

  def reduce_budget(transaction, budget)
    if transaction.price <= budget
       budget -= transaction.price
    end
    return budget
  end

  def transactions_per_category( category_id )
    sum = 0
    @transactions.each do |transaction|
      if transaction.category_id == category_id
        sum += transaction.price
      end
    end
    return sum
  end


end
