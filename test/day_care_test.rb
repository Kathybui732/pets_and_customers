require 'minitest/autorun'
require 'minitest/pride'
require './lib/day_care'
require './lib/customer'
require './lib/pet'

class DayCareTest < Minitest::Test

  def setup
    @day_care = DayCare.new("Claws n' Paws")
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    @justin = Customer.new("Justin", 5)
    @toki = Pet.new({name: "Toki", type: :rabbit, age: 7})
    @tofu = Pet.new({name: "Tofu", type: :dog, age: 13})
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    @justin.adopt(@toki)
    @justin.adopt(@tofu)
  end

  def test_it_exists
    assert_instance_of DayCare, @day_care
  end

  def test_it_has_attributes
    assert_equal "Claws n' Paws", @day_care.name
  end

  def test_it_starts_with_no_customers
    assert_equal [], @day_care.customers
  end

  def test_it_can_add_customers
    @day_care.add_customer(@joel)
    @day_care.add_customer(@justin)
    assert_equal [@joel, @justin], @day_care.customers
  end

  def test_find_customer_by_id
    @day_care.add_customer(@joel)
    @day_care.add_customer(@justin)
    assert_equal @joel, @day_care.find_customer(2)
  end

  def test_list_all_unfed_pets
    @day_care.add_customer(@joel)
    @day_care.add_customer(@justin)
    @lucy.feed
    @toki.feed
    assert_equal [@samson, @lucy, @toki, @tofu], @day_care.all_pets
    assert_equal [@samson, @tofu], @day_care.unfed_pets
  end

  def test_feed_all_pets
    @day_care.add_customer(@joel)
    @day_care.add_customer(@justin)
    @lucy.feed
    @toki.feed
    assert_equal false, @samson.fed?
    assert_equal false, @tofu.fed?
    @day_care.feed_all
    assert_equal [], @day_care.unfed_pets
    assert_equal true, @samson.fed?
    assert_equal true, @tofu.fed?
  end

  def test_unfed_pets_by_customer
    @day_care.add_customer(@joel)
    @day_care.add_customer(@justin)
    @toki.feed
    expected = {
      @joel => [:dog, :cat],
      @justin => [:dog]
    }
    assert_equal expected, @day_care.unfed_pets_by_customer
  end

  def test_charge_customers_for_feeding
    @day_care.add_customer(@joel)
    @day_care.add_customer(@justin)
    @toki.feed
    @day_care.charge_customers
    @day_care.feed_all
    assert_equal 35, @joel.outstanding_balance
    assert_equal 10, @justin.outstanding_balance
  end
end























#   def test_it_exists
#     day_care = DayCare.new("The Dog Spot")
#     assert_instance_of DayCare, day_care
#   end
#
#   def test_it_has_a_name
#     day_care = DayCare.new("The Dog Spot")
#     assert_equal "The Dog Spot", day_care.name
#   end
#
#   def test_it_starts_with_no_customers
#     day_care = DayCare.new("The Dog Spot")
#     assert_equal [], day_care.customers
#   end
#
#   def test_it_can_add_customers
#     day_care = DayCare.new("The Dog Spot")
#     joel = Customer.new("Joel", 2)
#     billy = Customer.new("Billy", 3)
#     day_care.add_customer(joel)
#     day_care.add_customer(billy)
#     assert_equal [joel, billy], day_care.customers
#   end
#
#   def test_it_can_list_unfed_pets
#     joel = Customer.new("Joel", 2)
#     samson = Pet.new({name: "Samson", type: :dog})
#     lucy = Pet.new({name: "Lucy", type: :cat})
#     joel.adopt(samson)
#     joel.adopt(lucy)
#     billy = Customer.new("Billy", 3)
#     molly = Pet.new({name: "Molly", type: :cat})
#     billy.adopt(molly)
#     day_care = DayCare.new("The Dog Spot")
#     day_care.add_customer(joel)
#     day_care.add_customer(billy)
#     lucy.feed
#
#     assert_equal [samson, molly], day_care.unfed_pets
#   end
#
#   def test_it_can_find_customer_by_id
#     joel = Customer.new("Joel", 2)
#     joel.charge(10)
#     billy = Customer.new("Billy", 3)
#     day_care = DayCare.new("The Dog Spot")
#     day_care.add_customer(joel)
#     day_care.add_customer(billy)
#     assert_equal joel, day_care.customer_by_id(2)
#   end
# end
