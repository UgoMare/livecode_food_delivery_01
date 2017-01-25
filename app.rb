require 'pry-byebug'

require_relative 'router'
require_relative 'app/controllers/customers_controller.rb'
require_relative 'app/controllers/meals_controller.rb'
require_relative 'app/repositories/customers_repository.rb'
require_relative 'app/repositories/meals_repository.rb'
require_relative 'app/repositories/employees_repository.rb'
require_relative 'app/controllers/sessions_controller.rb'
require_relative 'app/repositories/orders_repository.rb'
require_relative 'app/controllers/orders_controller.rb'


meals_repository = MealsRepository.new('data/meals.csv')
meals_controller = MealsController.new(meals_repository)

customers_repository = CustomersRepository.new('data/customers.csv')
customers_controller = CustomersController.new(customers_repository)

employees_repository = EmployeesRepository.new('data/employees.csv')
sessions_controller = SessionsController.new(employees_repository)

orders_repository = OrderRepository.new('data/orders.csv', meals_repository,
                                        customers_repository, employees_repository)

orders_controller = OrdersController.new(orders_repository, meals_repository,
                                         employees_repository, customers_repository)


router = Router.new(meals_controller, customers_controller, sessions_controller,
                    orders_controller)

router.run
