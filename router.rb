class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @employee = nil
  end

  def run
    loop do
      @employee = @sessions_controller.login
      while @employee != nil
        if @employee.manager?
          print_manager_menu
          action = ask_user_for_action
          route_manager_action(action)
        else
          print_delivery_guy_menu
          action = ask_user_for_action
          route_delivery_guy_action(action)
        end
      end
      print `clear`
    end
  end

  private
  def print_manager_menu
    p '1- List all the meals'
    p '2- Add a new meal'
    p '3- List all the customers'
    p '4- Add a new customer'
    p '0- Logout'
  end

  def print_delivery_guy_menu
    p '1- List all the orders'
    p '2- Mark an order as delivered'
    p '0- Logout'
  end

  def ask_user_for_action
    gets.chomp.to_i
  end

  def route_manager_action(action)
    case action
    when 1
      @meals_controller.list
    when 2
      @meals_controller.add
    when 3
      @customers_controller.list
    when 4
      @customers_controller.add
    when 0
      @employee = nil
    end
  end

  def route_delivery_guy_action(action)
    case action
    when 1
      #TODO add the orders controller
    when 2
      #TODO add the orders controller
    when 0
      @employee = nil
    end
  end
end
