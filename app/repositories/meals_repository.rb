require_relative '../models/meal'
require 'csv'
require_relative 'base_repository'

class MealsRepository < BaseRepository
  def self.create_array
    ['name', 'price', 'id']
  end

  def create_instance(row)
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end



