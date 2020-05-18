class Waiter
    attr_accessor :name, :yrs_experience
# Created and array for all the waiter.
    @@all = []
# Initialized the waiter instance  with a name, yrs_experience able to store instance created.
    def initialize(name, yrs_experience)
        @name = name 
        @yrs_experience = yrs_experience
        @@all << self
    end
# Return all the instances created.
    def self.all
        @@all
    end
# Give the Waiter the ability to created a meal.
    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end
# Return an array of all the meals instances associated with this waiter.
    def meals 
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end
# Return Customer instance associated with the meal that received the largest tip.
    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b| 
            meal_a.tip <=> meal_b.tip
        end
        best_tipped_meal.customer
    end
end