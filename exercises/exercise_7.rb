require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

### Exercise 7: Validations for both models

# 1. Add validations to two models to enforce the following business rules:
#   * Employees must always have a first name present
#   * Employees must always have a last name present
#   * Employees have a hourly_rate that is a number (integer) between 40 and 200
#   * Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
#   * Stores must always have a name that is a minimum of 3 characters
#   * Stores have an annual_revenue that is a number (integer) that must be 0 or more
#   * BONUS: Stores must carry at least one of the men's or women's apparel 
#     (hint: use a [custom validation method](http://guides.rubyonrails.org/active_record_validations.html#custom-methods) - **don't** use a `Validator` class)
# 2. Ask the user for a store name (store it in a variable)
# 3. Attempt to create a store with the inputted name but leave out the other fields (annual_revenue, mens_apparel, 
#     and womens_apparel)
# 4. Display the error messages provided back from ActiveRecord to the user (one on each line) after you attempt to 
#     save/create the record

class Employee < ActiveRecord::Base
  has_many :employees
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, presence: true
  validates :hourly_rate, numericality: { only_integer: true }
  validates :hourly_rate, inclusion: { in: 40...200 }
  validates :store_id, presence: true
end

class Store < ActiveRecord::Base
  belongs_to :store
  validates :name, length: { minimum: 3, message: "%{name} is not a valid size" }
  validates :annual_revenue, presence: true
  validates :annual_revenue, numericality: { only_integer: true, greater_than: 0 }
  validate :must_have_mens_or_womens

  def must_have_mens_or_womens
    if :mens_apparel.present? || :womens_apparel.present?
      errors.add(:apparel, "must carry at least one of the men's or women's apparel")
    end
  end
end

# puts "What is the name of a new Store?"
# new_store = gets.chomp
# puts "What is the annual revenue?"
# new_revenue = gets.chomp.to_i

# @new_store = Store.create(name: new_store, annual_revenue: new_revenue)
# @new_store.valid? ? (puts "Saving") : (puts @new_store.errors.messages)
# @new_store.save

puts @store1.employees.create(first_name: "Thor", last_name: "Beast", hourly_rate: 60).errors.messages
