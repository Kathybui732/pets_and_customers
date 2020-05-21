# -name
# -customers w/pets prob array
# -groomer can find all customers by id
# -lists pets unfed
#
# methods:
# attr_reader name
# customers = []
# customers_
# number_pets_unfed

class DayCare
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def find_customer(id)
    @customers.find do |customer|
      customer.id == id
    end
  end

  def all_pets
    @customers.flat_map do |customer|
      customer.pets
    end
  end

  def unfed_pets
    all_pets.select do |pet|
      !pet.fed?
    end
  end
end



























# class DayCare
#   attr_reader :name,
#               :customers
#
#   def initialize(name)
#     @name = name
#     @customers = []
#   end
#
#   def add_customer(customer)
#     @customers << customer
#   end
#
#   def customer_by_id(id)
#     @customers.find do |customer|
#       customer.id == id
#     end
#   end
#
#   def unfed_pets
#     pets = @customers.map do |customer|
#       customer.pets
#     end.flatten
#     pets.find_all do |pet|
#       !pet.fed?
#     end
#   end
# end
