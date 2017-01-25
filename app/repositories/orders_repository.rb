require_relative '../models/order'

class OrderRepository < BaseRepository

  def initialize(csv_file, meals_repository, customers_repository, employees_repository)
    @meals_repository = meals_repository
    @customers_repository = customers_repository
    @employees_repository = employees_repository
    super(csv_file)
  end

  def self.create_array
    [:id, :meal_id, :customer_id, :employee_id, :delivered]
  end

  def create_instance(row)
    #Convert all the ids into Fixnum
    meal_id = row[:meal_id].to_i
    customer_id = row[:customer_id].to_i
    employee_id = row[:employee_id].to_i

    row[:id] = row[:id].to_i
    #Find the instance corresponding to the id
    row[:meal] = @meals_repository.find(meal_id)
    row[:customer] = @customers_repository.find(customer_id)
    row[:employee] = @employees_repository.find(employee_id)
    row[:delivered] = row[:delivered] == 'true'

    Order.new(row)

  end

  def list_undelivered
    @elements.select { |e| e.undelivered? }
  end


end
