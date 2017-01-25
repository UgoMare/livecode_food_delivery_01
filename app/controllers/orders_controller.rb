require_relative '../views/orders_view'

class OrdersController
  def initialize(orders_repository, meals_repository,
                 employees_repository, customers_repository)

    @orders_repository = orders_repository
    @meals_repository = meals_repository
    @employees_repository = employees_repository
    @customers_repository = customers_repository
    @view = OrdersView.new
  end

  def list
    orders = @orders_repository.list
    @view.list_orders(orders)
  end

  def add
    #1- Ask for meal
    meal_id = @view.ask_user_for('meal', @meals_repository.list)
    #2- Ask for customer
    customer_id = @view.ask_user_for('customer', @customers_repository.list)
    #3- Ask for employee
    employee_id = @view.ask_user_for('employee', @employees_repository.list)

    params = {}
    params[:meal] = @meals_repository.find(meal_id)
    params[:customer] = @customers_repository.find(customer_id)
    params[:employee] = @employees_repository.find(employee_id)

    new_order = Order.new(params)

    @orders_repository.add(new_order)
  end

  def list_undelivered_orders
    orders = @orders_repository.list_undelivered
    @view.list_orders(orders)
  end

  def mark_order_as_delivered
    list_undelivered_orders
    order_id = @view.ask_for_order_id
    order = @orders_repository.find(order_id)
    order.delivered!
    @orders_repository.write_to_csv # Write the updated order in the CSV file
  end

end




