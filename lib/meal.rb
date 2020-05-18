class Meal
    attr_accessor :waiter, :customer, :total, :tip
# Created an empty array to store Meal instance
    @@all = []
# Initialized the meal instance with a waiter, customer, total, tip=0 and store the instance.
    def initialize(waiter, customer, total, tip=0)
        @waiter = waiter
        @customer = customer 
        @total = total
        @tip = tip
        @@all << self
    end
# Return all the instances created.
    def self.all 
        @@all
    end
end