require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(repository)
    @repository = repository
    @view = MealsView.new
  end

  def add
    @name = @view.ask_user_for_name
    @price = @view.ask_user_for_price.to_i
    @repository.add(Meal.new(name: @name, price: @price))
  end

  def list
    display_list
  end



private

  def display_list
    meals = @repository.list
    @view.display_list(meals)
  end



end
