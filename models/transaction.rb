require_relative('../db/sql_runner')
require_relative('category')
require_relative('shop')
# require_relative('wallet')

class Transaction

  attr_reader :id
  attr_accessor :title, :price, :date_input, :category_id, :shop_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @date_input = options["date_input"]                  #to_date?
    @price = options["price"].to_f
    @category_id = options["category_id"]
    @shop_id = options["shop_id"]
  end

  def print_tag()
    return "#{@title}, #{@price}, #{@date_input}"
  end


  def save()
    sql = "INSERT INTO transactions
    (
      title,
      date_input,
      price,
      category_id,
      shop_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING *"
    values = [@title, @date_input, @price, @category_id, @shop_id]
    transaction_data = SqlRunner.run(sql, values)
    @id = transaction_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE transactions
    SET
    (
      title,
      date_input,
      price,
      category_id,
      shop_id
      ) =
      (
        $1, $2, $3, $4, $5
      )
      WHERE id = $6"
      values = [@title, @date_input, @price, @category_id, @shop_id, @id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM transactions
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def self.all()
      sql = "SELECT * FROM transactions"
      values = []
      transactions = SqlRunner.run( sql, values )
      result = transactions.map { |transaction| Transaction.new( transaction ) }
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM transactions
      WHERE id = $1"
      values = [id]
      transaction = SqlRunner.run( sql, values )
      result = Transaction.new( transaction.first )
      return result
    end

    def self.find_last_entry
      sql = "SELECT * FROM transactions ORDER BY id DESC"
      return SqlRunner.run( sql )[ 0 ]
    end


    def category
      sql = "SELECT * FROM categories
      WHERE id = $1"
      values = [@category_id]
      category = SqlRunner.run( sql, values )
      result = Category.new( category.first )
      return result
    end

    def shop
      sql = "SELECT * FROM shops
      WHERE id = $1"
      values = [@shop_id]
      shop = SqlRunner.run( sql, values )
      result = Shop.new( shop.first )
      return result
    end


    def self.map_items(transactions_data)# just not to repeat the .map in every method
      result = transactions_data.map {|transaction| Transaction.new(transaction)}
      return result
    end

    def self.total_spent
      sql = "SELECT SUM(price) FROM transactions"
      sum = SqlRunner.run(sql)
      total = sum.first
      return total["sum"]
    end

    def self.total_spent_per_category(category_id)
      sql = "SELECT SUM(price) FROM transactions WHERE id = $1"
      values = [category_id]
      sum = SqlRunner.run(sql, values)
      total = sum.first
      return total["sum"]
    end

end
