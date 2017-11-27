require_relative('../db/sql_runner')
require_relative('transaction')

class Category

  attr_reader :id
  attr_accessor :tag_name, :amount_limit

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @tag_name = options['tag_name']
    @amount_limit = options['amount_limit'].to_f
  end

  def save()
    sql = "INSERT INTO categories
    (
      tag_name,
      amount_limit
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@tag_name, @amount_limit]
    categories_data = SqlRunner.run(sql, values)
    @id = categories_data.first()['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM categories"
    values = []
    categories = SqlRunner.run( sql, values )
    result = categories.map { |category| Category.new( category ) }
    return result
  end

  def self.find_by_name (tag_name)
    sql = "SELECT * FROM categories WHERE tag_name = $1"
    values = [tag_name]
    category = SqlRunner.run( sql, values )
    result = category.map { |category| Category.new( category ) }
    return result
  end

  def self.map_items(category_data)# just not to repeat the .map in every method
    result = category_data.map {|category| Category.new(category)}
    return result
  end

end
