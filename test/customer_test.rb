require "minitest/autorun"
require "minitest/pride"
require "./lib/customer"
require "./lib/pet"

class CustomerTest < Minitest::Test

  def setup
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
  end

  def test_it_exists
    assert_instance_of Customer, @joel
  end

  def test_it_has_attributes
    assert_equal "Joel", @joel.name
    assert_equal 2, @joel.id
  end

  def test_it_starts_with_no_pets
    assert_equal [], @joel.pets
  end

  def test_test_adopt_adds_to_pets_array
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    assert_equal [@samson, @lucy], @joel.pets
  end

  def test_starts_with_no_outstanding_balance
    assert_equal 0, @joel.outstanding_balance
  end

  def test_charge_adds_to_outstanding_balance
    @joel.charge(15)
    @joel.charge(7)
    assert_equal 22, @joel.outstanding_balance
  end
end
