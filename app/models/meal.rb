class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(args = {})
    @name = args[:name]
    @price = args[:price]
    @id = args[:id]

  end

  def to_array
    [@name, @price, @id]
  end

  def to_s
    "#{@id} - #{@name}, $#{@price}"
  end
end

