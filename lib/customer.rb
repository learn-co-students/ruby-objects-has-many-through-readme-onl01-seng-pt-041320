require 'pry'
require 'JSON'
class Customer

    attr_accessor :name, :age
    
    @@all = []
    
    def initialize(name, age)
        @name, @age = name, age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip = 0)
        Meal.new(waiter, self, total, tip)
    end

    def meals #returns an Array of Meal instances associated with this customer
    #Meal.all.select(&:customer)
    #binding.pry
        Meal.all.select{|m| m.customer.name == self.name}
        # binding.pry
    end

    def waiters #returns an Array of Waiter instances associated with this customer's meals
       meals.map{|m| m.waiter}
        # meals.map {|m| meal.waiter}
        # binding.pry
    end
end