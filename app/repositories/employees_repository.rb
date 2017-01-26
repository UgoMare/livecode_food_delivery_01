require_relative '../models/employee'

class EmployeesRepository

  def initialize
    @employees = []

    data = DB.execute('SELECT * FROM employees')
    data.each do |employee_data|
      employee = Employee.new(id: employee_data[0].to_i,
                              username: employee_data[1],
                              password: employee_data[2],
                              role: employee_data[3])
      @employees << employee
    end
  end

  def find_by_username(username)
    @employees.find {|e| e.username == username}
  end

  def find(id)
    @employees.select { |element| element.id == id }[0]
  end

  def list
    @employees
  end
end
