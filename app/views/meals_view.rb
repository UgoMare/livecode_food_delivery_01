class MealsView

  def display_list(meals)
    meals.each { |meal| p "#{meal.id}. #{meal.name} - #{meal.price}" }
  end


  def ask_user_for_name
    puts 'What is the name of the meal?'
    gets.chomp
  end


  def ask_user_for_price
    puts 'How much does it cost?'
    gets.chomp
  end

end
