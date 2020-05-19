require 'pry'

class Customer

    attr_accessor :name, :age 

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        #binding.pry
        meal = Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.customer == self }
       # binding.pry
    end

    def waiters
        #binding.pry
        self.meals.map { |meal| meal.waiter }
       
    end
  
end