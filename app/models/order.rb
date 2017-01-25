class Order
  attr_reader :meal, :employee, :customer
  attr_accessor :id
  def initialize(args = {})
    @id = args[:id]
    @meal = args[:meal]
    @employee = args[:employee]
    @customer = args[:customer]
    @delivered = args[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def undelivered?
    !delivered?
  end

  def delivered!
    @delivered = true
  end

  def to_array
    [@id, @meal.id, @customer.id, @employee.id, @delivered]
  end
end
