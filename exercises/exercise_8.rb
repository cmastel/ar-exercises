require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'
require_relative './exercise_7'


puts "Exercise 8"
puts "----------"

class Employee
  before_create :create_random_password

  private
    def create_random_password
      charset = Array('A'..'Z') + Array('a'..'z')
      if password.nil?
        self.password = Array.new(8) { charset.sample}.join
      end
    end

end

@store2.employees.create(first_name: "The", last_name: "Hulk", hourly_rate: 60).errors.messages
result = Employee.find_by(last_name: "Hulk")
puts "The Hulk's password is: #{result.password}"