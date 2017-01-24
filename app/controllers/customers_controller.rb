require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(repository)
    @repository = repository
    @view = CustomersView.new
  end

  def add
    @name = @view.ask_user_for_name
    @address = @view.ask_user_for_address
    @repository.add(Customer.new(name: @name, address: @address))
  end

  def list
    display_list
  end



private

  def display_list
    customers = @repository.list
    @view.display_list(customers)
  end



end
