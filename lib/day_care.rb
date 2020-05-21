# -name
# -customers w/pets prob array
# -groomer can find all customers with outstanding balance
# -count number of pets by type
#
# methods:
# attr_reader name
# customers = []
# customers_with_outstanding_balance
# number_pets_by_type

class DayCare
  attr_reader :name

  def initialize(argument)
    @argument = argument
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
