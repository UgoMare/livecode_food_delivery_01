# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/controllers/customers_controller.rb'
require_relative 'app/repositories/customers_repository.rb'



repository = CustomersRepository.new('data.csv')
controller = CustomersController.new(repository)

controller.add
controller.list




