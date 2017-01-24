require_relative '../models/customer'
require 'csv'
require_relative 'base_repository'

class CustomersRepository < BaseRepository
  def self.create_array
    ['id', 'name', 'address']
  end

  def create_instance(row)
    Customer.new(row)
  end
end


