require_relative '../models/employee'

class EmployeesRepository < BaseRepository
   def self.create_array
    ['id', 'username', 'password', 'role']
  end

  def create_instance(row)
    Employee.new(row)
  end

  def add
    return nil
  end

  def find_by_username(username)
    @elements.find {|e| e.username == username}
  end
end
