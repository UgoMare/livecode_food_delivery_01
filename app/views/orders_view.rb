class OrdersView

  def list_orders(orders)
    orders.each do |order|
      status = order.delivered?? 'X' : ' '
      puts "[#{status}] ##{order.id}, #{order.meal.name} #{order.customer.name}"
    end
  end

  def ask_user_for(name, elements)
    elements.each do |e|
      puts e.to_s # call to_s on Meal, Customer or Employee instance
    end
    puts "Select one #{name}"
    print '> '
    return gets.chomp.to_i
  end

  def ask_for_order_id
    puts 'Which order do you want to mark as deliverd?'
    print '> '
    return gets.chomp.to_i
  end
end
