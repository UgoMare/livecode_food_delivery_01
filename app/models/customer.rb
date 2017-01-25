class Customer
  attr_accessor :id
  attr_reader :name, :address
  def initialize(arg = {})
    @id = arg[:id]
    @name = arg[:name]
    @address = arg[:address]
  end

  def to_array
    [@id, @name, @address]
  end

  def to_s
    "#{@id}. #{@name}, #{@address}"
  end
end
