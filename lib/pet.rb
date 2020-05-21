class Pet
  attr_reader :name,
              :type,
              :age

  def initialize(pets_params)
    @name = pets_params[:name]
    @type = pets_params[:type]
    @age = pets_params[:age]
    @fed = false
  end

  def fed?
    @fed
  end

  def feed
    @fed = true
  end
end






















# class Pet
#   attr_reader :name,
#               :type
#
#   def initialize(attributes)
#     @name = attributes[:name]
#     @type = attributes[:type]
#     @fed = false
#   end
#
#   def feed
#     @fed = true
#   end
#
#   def fed?
#     @fed
#   end
# end
