class Employee

  attr_reader :username, :password
  def initialize(args = {})
    @id = args[:id]
    @username = args[:username]
    @password = args[:password]
    @role = args[:role]
  end

   def to_array
    [@id, @username, @password, @role]
  end

  def manager?
    @role == 'manager'
  end
end
