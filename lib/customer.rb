class Customer
    attr_accessor :name, :age
# Created an empty array for all the customer.
    @@all = []
# Initialized a Customer instance  with a name, age able to store instance created.
    def initialize(name, age)
        @name = name 
        @age = age 
        @@all << self
    end
# Return all the instances created.
    def self.all 
        @@all
    end
    # Customer look at all meals and select one that belong to them.
    def meals 
        Meal.all.select do |meal| 
            meal.customer == self
        end
    end
    # Return an array of waiter instances associated with this customer meals.
    def waiters 
        meals.map do |meal|
            meal.waiter
        end
    end
# Give the customer the ability to created a meal.
    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end
#  Initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip.
    def new_meal_20_percent(waiter, total)
        tip = total * 0.2
        Meal.new(waiter, self, total, tip)
    end
# Return the oldest customer Instance.
    def self.oldest_customer
            oldest_age = 0
            oldest_customer = nil
        self.all.each do |customer|
            if customer.age > oldest_age
            oldest_age = customer.age
            oldest_customer = customer
            end
        end
        oldest_customer
    end
end