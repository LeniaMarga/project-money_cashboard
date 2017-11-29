require_relative('../db/sql_runner')

class Shop

  attr_reader :id
  attr_accessor :shop_name, :location


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @shop_name= options['shop_name']
    @location = options["location"]
  end

  def print()
    return "#{@shop_name} #{@location} "
  end

  def save()
    sql = "INSERT INTO shops
    (
      shop_name,
      location
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@shop_name, @location]
    shops_data = SqlRunner.run(sql, values)
    @id = shops_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE shops
    SET
    (
      shop_name,
      location
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@shop_name, @location, @id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM shops
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

  def self.all
    sql = "SELECT * FROM shops"
    values = []
    shops = SqlRunner.run( sql, values )
    result = shops.map { |shop| Shop.new( shop ) }
    return result
  end

  def self.find_by_name (shop_name)
    sql = "SELECT * FROM shops WHERE shop_name = $1"
    values = [shop_name]
    shop = SqlRunner.run( sql, values )
    result = shop.map { |shop| Shop.new( shop ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM shops
    WHERE id = $1"
    values = [id]
    shop = SqlRunner.run( sql, values )
    result = Transaction.new( shop.first )
    return result
  end

  def self.map_items(shop_data)
    result = shop_data.map {|shop| Shop.new(shop)}
    return result
  end



end
