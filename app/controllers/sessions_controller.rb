require_relative '../views/sessions_view'

class SessionsController
  def initialize(employees_repository)
    @employees_repository = employees_repository
    @view = SessionsView.new
  end

  def login
    username = @view.ask_user_for_username
    password = @view.ask_user_for_password

    #1- The username dont match an Employee
    employee = @employees_repository.find_by_username(username)
    #2- The username match an Employee but the
    #password is wrong
    if employee && employee.password == password
      #logged in
      @view.logged_in
      return employee
    else
      @view.wrong_credentials
      login #recursive call
    end
    #3- Both username & password are correct
  end
end
