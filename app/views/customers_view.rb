class CustomersView
  def display_list(customers)
    customers.each { |customer| p "#{customer.id}. #{customer.name} - #{customer.address}" }
  end

  def ask_user_for_name
    puts 'What is the name of the customer?'
    gets.chomp
  end

  def ask_user_for_address
    puts 'Where does the customer live?'
    gets.chomp
  end
end
